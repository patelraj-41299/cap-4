variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "codebuild_role_arn" {
  description = "IAM role ARN for CodeBuild"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket name to store CodeBuild artifacts"
  type        = string
}

variable "repo_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "branch" {
  description = "GitHub branch to build from"
  type        = string
}

variable "buildspec_location" {
  description = "Path to buildspec.yml file"
  type        = string
}
