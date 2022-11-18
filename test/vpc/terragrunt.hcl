include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.18.1"
}

inputs = {
  name = "demo"

  azs             = ["us-east1a", "us-east1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

