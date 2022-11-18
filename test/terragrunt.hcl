locals {
  aws_region   = "us-east-1"
  state_bucket = "terragrunt-demo-state"
  state_path   = "two-envs-one-vpc"

  envs = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}
# Configure Terragrunt to automatically store tfstate (Terraform state) files in an S3 bucket
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = local.state_bucket

    key     = "${local.state_path}/${path_relative_to_include()}/terraform.tfstate"
    region  = local.aws_region
    encrypt = true
  }
}

inputs = merge(
  local.envs.locals,
)
