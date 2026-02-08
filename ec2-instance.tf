 data "aws_ami" "ubuntu" {
      most_recent = true
      owners      = ["099720109477"] # Owner is Canonical

      filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
      }

      filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }
    }

    resource "aws_instance" "ec3-instances" {
      count         = var.ec2_instance_count
      ami           = data.aws_ami.ubuntu.id
      instance_type = "t3.micro"
      subnet_id = aws_subnet.subnets[count.index % var.subnet-count].id

      tags = {
        Name    = "${local.project}-ec2-${count.index}"
        Project = local.project
      }
    }