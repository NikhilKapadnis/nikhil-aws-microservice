output "listener_rule_arn" {
  value       = aws_lb_listener_rule.this.arn
  description = "ARN of the listener rule"
}