### ✅ envs/dev/backend.tf
terraform {
  backend "s3" {
    bucket         = "cap4-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}