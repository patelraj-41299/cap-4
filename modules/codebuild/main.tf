resource "aws_codebuild_project" "this" {
  name         = "${var.env}-codebuild"
  service_role = var.codebuild_role_arn

  artifacts {
    type     = "S3"
    location = var.artifact_bucket
    packaging = "ZIP"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
  }

  source {
    type            = "GITHUB"
    location        = var.repo_url
    git_clone_depth = 1
    buildspec       = var.buildspec_location
  }
}
