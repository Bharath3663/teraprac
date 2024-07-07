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
