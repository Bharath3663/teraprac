provider "aws" {
  region = var.region
}
resource "aws_instance" "simple_ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "My VPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "Public Subnet"
  }
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}
resource "aws_ami" "my-ami" {
  name               = var.ami_name
  root_device_name    = var.root_device_name
  imds_support        = var.imds_support

  ebs_block_device {
    device_name = var.root_device_name
    snapshot_id = var.ebs_snapshot_id
    volume_size = var.ebs_volume_size
  }
}
resource "aws_iam_role" "my-role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      for service in var.assume_role_services : {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = service
        }
      }
    ]
  })

  tags = {
    Name = var.role_name
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  username              = var.username
  password              = var.password
  parameter_group_name  = var.parameter_group_name
  skip_final_snapshot   = var.skip_final_snapshot
}
resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.ebs_volume.id

  tags = {
    Name = var.snapshot_name
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id     = aws_vpc.my_vpc.id

  tags = var.tags
}
resource "aws_sns_topic" "my-sns" {
  name = var.topic_name
}
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size               = var.volume_size
  type               = var.volume_type
  tags               = var.tags
}
