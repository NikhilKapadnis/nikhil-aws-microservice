variable "log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group"
}

variable "retention_in_days" {
  type        = number
  description = "Retention period for log events in days"
}