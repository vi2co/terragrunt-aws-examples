module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.18.1"
}

  name = var.vpc_name
  cidr = var.vpc_cidr
  public_subnet_cider

  azs             = ["${var.aws_region}a"]
  public_subnets  = [var.public_subnet_cidr]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "web_srv" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance?ref=v4.2.1"

  name                      = "${var.environment_name}-web-server"
  instance_type             = var.instance_type
  vpc_id                    = module.vpc.vpc_id
  security_group_cidr_block = var.vpc_cidr
}

module "backend" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance?ref=v4.2.1"

  name                      = "${var.environment_name}-backend"
  instance_type             = var.instance_type
  vpc_id                    = module.vpc.vpc_id
  security_group_cidr_block = var.vpc_cidr
}
