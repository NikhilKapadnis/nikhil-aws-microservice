output "task_definition_arn" {
  value       = aws_ecs_task_definition.this.arn
  description = "ARN of the ECS task definition"
}

output "revision" {
  value       = aws_ecs_task_definition.this.revision
  description = "Revision number of the ECS task definition"
}

output "family" {
  value       = aws_ecs_task_definition.this.family
  description = "Family name of the ECS task definition"
}