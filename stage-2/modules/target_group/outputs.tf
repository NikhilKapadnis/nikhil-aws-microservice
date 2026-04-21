output "target_group_arn" {
  value       = aws_lb_target_group.this.arn
  description = "ARN of the target group"
}