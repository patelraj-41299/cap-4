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
  source            = "../../modules/codepipeline"
  name              = "cap4-dev-pipeline"
  role_arn          = "arn:aws:iam::060795913786:role/codepipeline-role"
  artifact_bucket   = "cap4-terraform-state"
  connection_arn    = "arn:aws:codeconnections:us-east-1:060795913786:connection/ba598d05-f246-4892-b8aa-307b4cc55c6a"
  repository        = "patelraj-41299/cap-4"
  branch            = "main"
  codebuild_project = module.dev_codebuild.project_name
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
