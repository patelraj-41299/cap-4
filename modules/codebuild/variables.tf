variable "codebuild_role_arn" {
  description = "IAM Role ARN for CodeBuild"
  type        = string
}

variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "repo_url" {
  description = "GitHub repository HTTPS URL"
  type        = string
}

variable "branch" {
  description = "GitHub branch to build from"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket where CodeBuild artifacts will be stored"
  type        = string
}

variable "buildspec_location" {
  description = "Path to the buildspec.yml or docker-buildspec.yml inside the project"
  type        = string
}
