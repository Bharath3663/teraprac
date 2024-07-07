resource "aws_vpc" "NEW" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "NEW"
  }
}
