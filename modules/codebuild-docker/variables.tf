variable "codebuild_role_arn" {
  description = "IAM Role ARN for CodeBuild"
  type        = string
}

variable "repo_url" {
  description = "GitHub repo URL"
  type        = string
}

variable "branch" {
  description = "GitHub branch name"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket for storing build artifacts"
  type        = string
}

variable "buildspec_location" {
  description = "Path to the buildspec.yml file"
  type        = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
}
