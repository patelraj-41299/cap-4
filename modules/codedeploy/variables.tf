variable "env" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "service_role_arn" {
  type = string
}

variable "app_name" {
  type = string
}

variable "deployment_group_name" {
  type = string
}

variable "ec2_tag_key" {
  description = "Tag key to identify EC2 instances"
  type        = string
  default     = "Name"
}

variable "ec2_tag_type" {
  description = "Type of EC2 tag filter"
  type        = string
  default     = "KEY_AND_VALUE"
}

variable "ec2_tag_value" {
  description = "Tag value to identify EC2 instances"
  type        = string
}
