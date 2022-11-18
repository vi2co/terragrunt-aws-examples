variable "name" {
  description = "Name of the server"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami" {
  description = "EC2 instance AMI"
  type        = string
  default     = "ami-0533f2ba8a1995cf9"
}

variable "key_name" {
  description = "EC2 instance key name"
  type        = string
  default     = "some_key"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "security_group_cidr_block" {
  description = "Security Group CIDR block"
  type        = string
}

