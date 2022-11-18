## Get details about the VPC
data "aws_vpc" "this" {
  tags {
    Name = var.vpc_name
  }
}
