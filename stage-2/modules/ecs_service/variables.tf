variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "cluster_arn" {
  type        = string
  description = "ARN of the ECS cluster"
}

variable "task_definition_arn" {
  type        = string
  description = "Task definition ARN"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for ECS tasks"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "Target group ARN"
}

variable "container_name" {
  type        = string
  description = "Container name"
}

variable "container_port" {
  type        = number
  description = "Container port"
}

variable "desired_count" {
  type        = number
  description = "Number of tasks to run"
}