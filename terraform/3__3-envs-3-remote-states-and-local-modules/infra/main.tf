module "vpc" {
  source = "../modules/vpc"

  name                = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cider
}

module "web_srv" {
  source = "../modules/app"

  name                      = "${var.environment_name}-web-server"
  instance_type             = var.instance_type
  vpc_id                    = module.vpc.vpc_id
  security_group_cidr_block = var.vpc_cidr
}

module "backend" {
  source = "../modules/app"

  name                      = "${var.environment_name}-backend"
  instance_type             = var.instance_type
  vpc_id                    = module.vpc.vpc_id
  security_group_cidr_block = var.vpc_cidr
}
