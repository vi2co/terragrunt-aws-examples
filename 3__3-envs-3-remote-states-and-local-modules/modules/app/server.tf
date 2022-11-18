resource "aws_instance" "production_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.server.id]
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id

  tags = {
    Name = "${var.name}"
  }
}

