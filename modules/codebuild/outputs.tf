output "project_name" {
  description = "The name of the CodeBuild project"
  value       = aws_codebuild_project.this.name
}
