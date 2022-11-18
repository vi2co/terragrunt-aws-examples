include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.18.1"
}

inputs = {
  name = "demo"
  cidr = "10.0.0.0/16"

  azs             = ["${include.root.locals.aws_region}a", "${include.root.locals.aws_region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = include.env.locals.common_tags
}

# how to merge tags and override tags?
