include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance?ref=v4.2.1"
}


dependency "vpc" {
  config_path = "../vpc"
}

dependency "bastion-sg" {
  config_path = "../bastion-sg"
}

inputs = {
  name = "${include.env.locals.env}-bastion

  ami                    = "ami-06640050dc3f556bb"
  instance_type          = "t2.micro"
  key_name               = "private_aws_account"
  vpc_security_group_ids = [dependency.bastion-sg.outputs.security_group_id]
  subnet_id              = dependency.vpc.outputs.public_subnets[0]
}
