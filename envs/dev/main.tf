### ✅ envs/dev/main.tf
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
  source  = "../../modules/security_groups"
  env     = var.env
  vpc_id  = module.vpc.vpc_id
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
