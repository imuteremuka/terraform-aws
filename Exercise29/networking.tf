resource "aws_vpc" "vpc_proj" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Project = local.project
    Name    = local.project
  }
}

resource "aws_subnet" "subnets" {
  count      = var.subnet-count
  vpc_id     = aws_vpc.vpc_proj.id
  cidr_block = "10.0.${count.index + 1}.0/24"
  tags = {
    Project = local.project
    Name    = "${local.project}-subnet-${count.index + 1}"
  }

}

