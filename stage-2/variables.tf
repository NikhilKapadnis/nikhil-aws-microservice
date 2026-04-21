variable "service_name" {
  type        = string
  description = "Name of the service"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the container"
}

variable "cpu" {
  type        = string
  description = "CPU units for the task definition"
}

variable "memory" {
  type        = string
  description = "Memory for the task definition"
}

variable "image_tag" {
  type        = string
  description = "Docker image tag"
}

variable "health_check_path" {
  type        = string
  description = "Health check path for target group"
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS tasks"
}

variable "log_retention_in_days" {
  type        = number
  description = "Retention days for CloudWatch logs"
  default     = 14
}

variable "listener_priority" {
  type        = number
  description = "Priority for ALB listener rule"
}

variable "path_patterns" {
  type        = list(string)
  description = "Path patterns for listener rule"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID from Stage 1"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs from Stage 1"
}

variable "alb_security_group_id" {
  type        = string
  description = "ALB security group ID from Stage 1"
}

variable "http_listener_arn" {
  type        = string
  description = "HTTP listener ARN from Stage 1"
}

variable "ecs_cluster_arn" {
  type        = string
  description = "ECS cluster ARN from Stage 1"
}

variable "execution_role_arn" {
  type        = string
  description = "Execution role ARN for ECS"
}

variable "task_role_arn" {
  type        = string
  description = "Task role ARN for ECS"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}