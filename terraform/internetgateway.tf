resource "aws_internet_gateway" "gw" {
  vpc_id     = aws_vpc.my_vpc.id

  tags = var.tags
}
