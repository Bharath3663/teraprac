resource "aws_subnet" "Public-1" {
  vpc_id = aws_vpc.NEW.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "Public-1"
  }
}

resource "aws_subnet" "Private-1" {
  vpc_id = aws_vpc.NEW.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "Private-1"
  }
}

