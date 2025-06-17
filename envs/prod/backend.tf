terraform {
  backend "s3" {
    bucket         = "cap4-terraform-state"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    key            = "prod/terraform.tfstate" # <-- THIS line
  }
}
