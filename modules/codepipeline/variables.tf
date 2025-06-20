variable "name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for CodePipeline"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket name for storing artifacts"
  type        = string
}

variable "connection_arn" {
  description = "CodeStar connection ARN"
  type        = string
}

variable "repository" {
  description = "GitHub repository in format owner/repo"
  type        = string
}

variable "branch" {
  description = "Branch name to trigger pipeline"
  type        = string
}

variable "codebuild_project" {
  description = "CodeBuild project name"
  type        = string
}
variable "codedeploy_app_name" {
  type = string
}

variable "codedeploy_deployment_group" {
  type = string
}
