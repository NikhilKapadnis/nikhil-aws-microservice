variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "container_port" {
  type        = number
  description = "Port on which the container listens"
}

variable "alb_security_group_id" {
  type        = string
  description = "Security group ID of the ALB"
}