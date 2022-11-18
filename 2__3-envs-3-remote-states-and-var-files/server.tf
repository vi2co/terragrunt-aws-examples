resource "aws_instance" "server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.server.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id

  tags = {
    Name = "${var.environment_name}-server"
  }
}

