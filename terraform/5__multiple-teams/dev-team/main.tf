## Get details about the VPC
data "aws_vpc" "current" {
  tags {
    Name = var.vpc_name
  }
}

## Describe servers
module "web_srv" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance?ref=v4.2.1"

  name                      = "${var.environment_name}-web-server"
  instance_type             = var.instance_type
  vpc_id                    = data.aws_vpc.current.id
  security_group_cidr_block = data.aws_vpc.current.cidr_block
}

module "backend" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance?ref=v4.2.1"

  name                      = "${var.environment_name}-backend"
  instance_type             = var.instance_type
  vpc_id                    = data.aws_vpc.current.id
  security_group_cidr_block = data.aws_vpc.current.cidr_block
}
