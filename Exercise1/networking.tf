

resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, { Name = "prod-vpc-terraform" })
}

resource "aws_subnet" "prod_public_subnet" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.0.0/24"
  tags       = merge(local.common_tags, { Name = "prod-public-subnet-terraform" })
}


resource "aws_subnet" "prod_public_subnetprivate_subnet" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.1.0/24"
  tags       = merge(local.common_tags, { Name = "prod-private-subnet-terraform" })

}

resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = merge(local.common_tags, { Name = "prod-igw-terraform" })

}


resource "aws_route_table" "prod_public_rtb" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id

  }
  tags = merge(local.common_tags, { Name = "prod-public-rtb-terraform" })
}

resource "aws_route_table_association" "prod_public_subnet" {
  subnet_id      = aws_subnet.prod_public_subnet.id
  route_table_id = aws_route_table.prod_public_rtb.id
}

resource "aws_security_group" "prod_web_sg" {
  name        = "prod-public-sg"
  description = "Allow public HTTP traffic"
  vpc_id      = aws_vpc.prod_vpc.id

}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.prod_web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  tags              = merge(local.common_tags, { Name = "prod-allow-http-rule" })

}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.prod_web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  tags              = merge(local.common_tags, { Name = "prod-allow-https-rule" })

}