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
