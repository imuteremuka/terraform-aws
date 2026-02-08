resource "aws_instance" "web" {
  ami                         = "ami-078ccce2ec899fb3d"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.prod_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.prod_web_sg.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 30
    volume_type           = "gp2"
  }
  tags = merge(local.common_tags, { Name = "prod-web-server-terraform" })
  lifecycle {
    create_before_destroy = true
  }
}