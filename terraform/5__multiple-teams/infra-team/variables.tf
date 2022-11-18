variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "Main"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.45.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.45.0.0/24"
}
