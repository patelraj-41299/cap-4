variable "codebuild_role_arn" {
  description = "IAM Role ARN for CodeBuild"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "repo_url" {
  description = "GitHub repo URL"
  type        = string
}

variable "branch" {
  description = "GitHub branch"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket for artifacts"
  type        = string
}

variable "buildspec_location" {
  description = "Path to buildspec.yml"
  type        = string
}
