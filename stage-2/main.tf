module "ecr" {
  source = "./modules/ecr"

  repository_name = var.service_name
}

module "log_group" {
  source = "./modules/log_group"

  log_group_name    = "/ecs/${var.service_name}"
  retention_in_days = var.log_retention_in_days
}

module "ecs_security_group" {
  source = "./modules/ecs_security_group"

  service_name          = var.service_name
  vpc_id                = var.vpc_id
  container_port        = var.container_port
  alb_security_group_id = var.alb_security_group_id
}

resource "aws_iam_role" "task_role" {
  name = "${var.service_name}-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

output "task_role_arn" {
  value = aws_iam_role.task_role.arn
}

module "target_group" {
  source = "./modules/target_group"

  service_name      = var.service_name
  vpc_id            = var.vpc_id
  container_port    = var.container_port
  health_check_path = var.health_check_path
}

module "listener_rule" {
  source = "./modules/listener_rule"

  listener_arn     = var.http_listener_arn
  priority         = var.listener_priority
  path_patterns    = var.path_patterns
  target_group_arn = module.target_group.target_group_arn
}

module "ecs_task_definition" {
  source = "./modules/ecs_task_definition"

  family             = var.service_name
  cpu                = var.cpu
  memory             = var.memory
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  container_name     = var.container_name
  container_port     = var.container_port
  image              = "${module.ecr.repository_url}:${var.image_tag}"
  aws_region         = var.aws_region
  log_group_name     = module.log_group.log_group_name
}

module "ecs_service" {
  source = "./modules/ecs_service"

  service_name        = var.service_name
  cluster_arn         = var.ecs_cluster_arn
  task_definition_arn = module.ecs_task_definition.task_definition_arn
  subnet_ids          = var.private_subnet_ids
  security_group_ids  = [module.ecs_security_group.security_group_id]
  target_group_arn    = module.target_group.target_group_arn
  container_name      = var.container_name
  container_port      = var.container_port
  desired_count       = var.desired_count
}