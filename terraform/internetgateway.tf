resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.NEW.id

  tags = var.tags
}
