include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules/vpc"
}

inputs = {
  vpc_name = "${include.env.locals.env}-demo"
}
