variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the target group will be created"
}

variable "container_port" {
  type        = number
  description = "Port on which the container listens"
}

variable "health_check_path" {
  type        = string
  description = "Health check path for the target group"
}