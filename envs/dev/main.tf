provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "../../modules/vpc"
  env                 = var.env
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  azs                 = var.azs
}

module "security_groups" {
  source = "../../modules/security_groups"
  env    = var.env
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "../../modules/ec2"
  env               = var.env
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.ec2_sg_id
}

module "alb" {
  source            = "../../modules/alb"
  env               = var.env
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.ec2_sg_id
  vpc_id            = module.vpc.vpc_id
}

module "dev_codebuild" {
  source             = "../../modules/codebuild"
  env                = var.env
  codebuild_role_arn = "arn:aws:iam::060795913786:role/codebuild-role"
  artifact_bucket    = "cap4-terraform-artifacts-dev"
  repo_url           = "https://github.com/patelraj-41299/cap-4"
  branch             = "main"
  buildspec_location = "envs/dev/buildspec.yml"
}


module "codepipeline" {
  source = "../../modules/codepipeline"

  name                        = "cap4-dev-pipeline"
  role_arn                    = var.codepipeline_role_arn
  artifact_bucket             = module.s3.bucket_id
  connection_arn              = var.connection_arn
  repository                  = var.repository
  branch                      = var.branch
  codebuild_project           = module.dev_codebuild.name
  codedeploy_app_name         = var.app_name
  codedeploy_deployment_group = var.deployment_group_name
}

module "dev_codebuild_docker" {
  source             = "../../modules/codebuild-docker"
  codebuild_role_arn = "arn:aws:iam::060795913786:role/codebuild-role"
  env                = var.env
  repo_url           = "https://github.com/patelraj-41299/cap-4"
  branch             = "main"
  artifact_bucket    = "cap4-terraform-artifacts-dev"
  buildspec_location = "app/frontend/buildspec.yml"
}
module "codedeploy" {
  source = "../../modules/codedeploy"

  app_name              = "cap4-app-dev"
  deployment_group_name = "cap4-dg-dev"
  service_role_arn      = "arn:aws:iam::060795913786:role/CodeDeployServiceRole"
  target_group_name     = module.alb.target_group_name

  ec2_tag_key   = "Name"
  ec2_tag_type  = "KEY_AND_VALUE"
  ec2_tag_value = "cap4-dev-ec2"
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "cap4-terraform-artifacts-dev"
}
