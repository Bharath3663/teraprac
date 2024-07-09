#AWS provider
variable "region" {
  type = string
  default = "us-east-1"
}

#ec2 instance variables
variable "instance_name" {
  type = string
  description = "Name for the EC2 instance"
  default = "My-EC2-Instance"
}

variable "ami" {
  type = string
  description = "AMI ID for the EC2 instance"
  default = "ami-01b799c439fd5516a"
}

variable "instance_type" {
  type = string
  description = "Instance type (e.g., t2.micro)"
  default = "t2.micro"
}

#VPC AND SUBNET
variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  type = string
  default = "10.0.1.0/24"
  description = "CIDR block for the Public Subnet"
}

variable "private_subnet_cidr_block" {
  type = string
  default = "10.0.4.0/24"
  description = "CIDR block for the Private Subnet"
}

variable "availability_zone" {
  type = string
  default = "us-east-1a"
  description = "Availability Zone for the subnets"
}

#s3 bucket
variable "bucket_name" {
  type = string
  description = "bucket3663"
}

variable "bucket_region" {
  type = string
  description = "us-west-2"
}

#ebs volume
variable "volume_size" {
  type = number
  description = "Size of the EBS volume in GiB"
  default = 10
}

variable "volume_type" {
  type = string
  description = "Type of the EBS volume (e.g., gp2, io1)"
  default = "gp2"
}

variable "tags" {
  type = map(string)
  description = "Tags to be applied to the EBS volume"
  default = {}
}

#sns topic
variable "topic_name" {
  type = string
  description = "my-sns"
}

#sanpshot
variable "snapshot_name" {
  type = string
  description = "The name to assign to the EBS snapshot."
  default = "HelloWorld_snap"
}

#rds instance
variable "db_name" {
  type = string
  description = "The name of the database to be created."
  default = "mydb"
}

variable "engine" {
  type = string
  description = "The database engine to use (e.g., mysql, postgresql)."
  default = "mysql"
}

variable "engine_version" {
  type = string
  description = "The specific version of the database engine to use (e.g., 8.0, 13.1)."
  default = "8.0"
}

variable "instance_class" {
  type = string
  description = "The AWS RDS instance class (e.g., db.t3.micro, db.m5.large)."
  default = "db.t3.micro"
}

variable "username" {
  type = string
  description = "bharath"
}

variable "password" {
  type = string
  description = "bharath3663"
  sensitive = true
}

variable "allocated_storage" {
  type = number
  description = "The amount of storage (in GiB) to allocate for the database instance."
  default = 10
}

variable "parameter_group_name" {
  type = string
  description = "The name of the RDS parameter group to associate with the instance."
  default = "default.mysql8.0"
}

variable "skip_final_snapshot" {
  type = bool
  description = "Whether to skip creating a final snapshot when the database instance is deleted."
  default = true
}

# IAM
variable "role_name" {
  type = string
  description = "The name of the IAM role to create."
  default = "my-role"
}

variable "assume_role_services" {
  type = list(string)
  description = "A list of AWS services that can assume this role."
  default = ["ec2.amazonaws.com"]
}

# AMI
variable "ami_name" {
  type = string
  description = "The name of the custom AMI to create."
  default = "my-ami"
}

variable "root_device_name" {
  type = string
  description = "The name of the root device for the AMI."
  default = "/dev/xvda"
}

variable "imds_support" {
  type = string
  description = "The Instance Metadata Service (IMDS) version to support for the AMI (e.g., v2.0)."
  default = "v2.0"
}

variable "ebs_volume_size" {
  type = number
  description = "The size (in GiB) of the EBS volume to create for the AMI."
  default = 10
}
