output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "log_group_name" {
  value = module.log_group.log_group_name
}

output "ecs_security_group_id" {
  value = module.ecs_security_group.security_group_id
}

output "target_group_arn" {
  value = module.target_group.target_group_arn
}

output "listener_rule_arn" {
  value = module.listener_rule.listener_rule_arn
}

output "task_definition_arn" {
  value = module.ecs_task_definition.task_definition_arn
}

output "task_definition_revision" {
  value = module.ecs_task_definition.revision
}

output "ecs_service_name" {
  value = module.ecs_service.service_name
}

output "ecs_service_arn" {
  value = module.ecs_service.service_arn
}