variable "environment_name" {
  description = "Environment name"
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
