variable "family" {
  type        = string
  description = "Family name of the ECS task definition"
}

variable "cpu" {
  type        = string
  description = "CPU units for the task definition"
}

variable "memory" {
  type        = string
  description = "Memory for the task definition"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM execution role ARN for ECS task"
}

variable "task_role_arn" {
  type        = string
  description = "IAM task role ARN for ECS task"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the container"
}

variable "image" {
  type        = string
  description = "Full image URI including tag"
}

variable "aws_region" {
  type        = string
  description = "AWS region for CloudWatch logs"
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch log group name"
}