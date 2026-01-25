

resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terraform VPC"
    ManagedBy = "Terraform"
  }
}
resource "aws_subnet" "prod_public_subnet" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "public-sub-terraform"
    ManagedBy = "Terraform"
  }
}

resource "aws_subnet" "prod_public_subnetprivate_subnet" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private-sub-terraform"
    ManagedBy = "Terraform"
  }
}
resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "Terraform IGW"
  }
}
resource "aws_route_table" "prod_public_rtb" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id


  }
}
resource "aws_route_table_association" "prod_public_subnet" {
  subnet_id      = aws_subnet.prod_public_subnet.id
  route_table_id = aws_route_table.prod_public_rtb.id
}