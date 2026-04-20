output "log_group_name" {
  value       = aws_cloudwatch_log_group.this.name
  description = "Name of the CloudWatch log group"
}

output "log_group_arn" {
  value       = aws_cloudwatch_log_group.this.arn
  description = "ARN of the CloudWatch log group"
}