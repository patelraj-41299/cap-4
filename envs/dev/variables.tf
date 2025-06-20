variable "env" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
variable "codedeploy_app_name" {
  type = string
}

variable "codedeploy_deployment_group" {
  type = string
}
variable "app_name" {
  type = string
}

variable "deployment_group_name" {
  type = string
}

variable "service_role_arn" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "ec2_tag_key" {
  type = string
}

variable "ec2_tag_type" {
  type = string
}

variable "ec2_tag_value" {
  type = string
}

variable "codepipeline_role_arn" {
  type = string
}

variable "connection_arn" {
  type = string
}

variable "repository" {
  type = string
}

variable "branch" {
  type = string
}

variable "codebuild_role_arn" {
  type = string
}