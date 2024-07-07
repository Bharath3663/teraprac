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
