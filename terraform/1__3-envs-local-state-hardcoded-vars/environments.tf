provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

## VPC and subnets
resource "aws_vpc" "main" {
  cidr_block = "10.25.0.0/16"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.25.1.0/24"

  tags = {
    Name = "Public"
  }
}


## Development Environment
resource "aws_security_group" "dev_server" {
  name        = "dev_server"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dev-server-sg"
  }
}

resource "aws_instance" "dev_server" {
  ami                         = "ami-0533f2ba8a1995cf9"
  instance_type               = "t3a.medium"
  key_name                    = "some_key"
  vpc_security_group_ids      = [aws_security_group.dev_server.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id

  tags = {
    Name = "dev-server"
  }
}


## Development Environment
resource "aws_security_group" "qa_server" {
  name        = "qa_server"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "qa-server-sg"
  }
}

resource "aws_instance" "qa_server" {
  ami                         = "ami-0533f2ba8a1995cf9"
  instance_type               = "t3a.medium"
  key_name                    = "some_key"
  vpc_security_group_ids      = [aws_security_group.qa_server.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id

  tags = {
    Name = "qa-server"
  }
}

## Production Environment
resource "aws_security_group" "production_server" {
  name        = "production_server"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "production-server-sg"
  }
}

resource "aws_instance" "production_server" {
  ami                         = "ami-0533f2ba8a1995cf9"
  instance_type               = "t3a.medium"
  key_name                    = "some_key"
  vpc_security_group_ids      = [aws_security_group.production_server.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id

  tags = {
    Name = "production-server"
  }
}

