include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v4.16.0"
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  name                = "${include.env.locals.env}-bastion-sg"
  description         = "Security group for the bastion host"
  vpc_id              = dependency.vpc.outputs.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]

  # tags = include.env.locals.common_tags
}
