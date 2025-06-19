variable "codedeploy_role_arn" {
  description = "IAM Role ARN for CodeDeploy"
  type        = string
}

variable "target_group_name" {
  description = "Target group name for ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "env" {
  description = "Environment (dev, staging, prod)"
  type        = string
}
