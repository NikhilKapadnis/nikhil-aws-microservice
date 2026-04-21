variable "listener_arn" {
  type        = string
  description = "ARN of the ALB listener"
}

variable "priority" {
  type        = number
  description = "Priority of the listener rule"
}

variable "path_patterns" {
  type        = list(string)
  description = "List of path patterns for routing"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group to forward traffic to"
}