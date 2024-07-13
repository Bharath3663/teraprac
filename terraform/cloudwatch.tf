resource "aws_cloudwatch_log_group" "my_app_logs" {
  name = var.log_group_name
  retention_in_days = 30 
}
