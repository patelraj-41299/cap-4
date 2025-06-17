resource "aws_codebuild_project" "this" {
  name          = "${var.env}-codebuild"
  description   = "Terraform CodeBuild project for ${var.env} environment"
  build_timeout = 30

  service_role  = var.codebuild_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:6.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }

  source {
    type            = "GITHUB"
    location        = var.repo_url
    git_clone_depth = 1
    buildspec       = "envs/${var.env}/buildspec.yml"
  }

  tags = {
    Environment = var.env
  }
}
