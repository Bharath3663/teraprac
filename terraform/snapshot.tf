resource "aws_ebs_snapshot" "ebs_snapshot" {
  volume_id = aws_ebs_volume.ebs_volume.id

  tags = {
    Name = var.snapshot_name
  }
}
