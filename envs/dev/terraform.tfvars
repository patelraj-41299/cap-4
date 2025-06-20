env                 = "dev"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
azs                 = ["us-east-1a", "us-east-1b"]
ami_id              = "ami-0c02fb55956c7d316"
key_name            = "key-1"
instance_type       = "t2.micro"

# CodeDeploy-related values
app_name              = "cap4-app-dev"
deployment_group_name = "cap4-dg-dev"
service_role_arn      = "arn:aws:iam::060795913786:role/CodeDeployServiceRole"
target_group_name     = "cap4-dev-tg"

ec2_tag_key   = "Name"
ec2_tag_type  = "KEY_AND_VALUE"
ec2_tag_value = "cap4-dev-ec2"
