resource "aws_codebuild_project" "this" {
  name         = "cap4-${var.env}-docker"
  description  = "Build and push Docker image to ECR for ${var.env}"
  service_role = var.codebuild_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:7.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "REPO_URL"
      value = var.repo_url
    }

    environment_variable {
      name  = "BRANCH"
      value = var.branch
    }

    environment_variable {
      name  = "ENV"
      value = var.env
    }
  }

  source {
    type            = "GITHUB"
    location        = var.repo_url
    git_clone_depth = 1
    buildspec       = var.buildspec_location
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/cap4-${var.env}-docker"
      stream_name = "build-log"
    }
  }
}
