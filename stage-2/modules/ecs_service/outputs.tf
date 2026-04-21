output "service_name" {
  value       = aws_ecs_service.this.name
  description = "ECS service name"
}

output "service_arn" {
  value       = aws_ecs_service.this.arn
  description = "ECS service ARN"
}