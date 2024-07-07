resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size               = var.volume_size
  type               = var.volume_type
  tags               = var.tags
}
