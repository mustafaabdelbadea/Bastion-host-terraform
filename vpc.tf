resource "aws_vpc" "terraformVpc" {
  cidr_block           = var.VPC_CIDR
  enable_dns_hostnames = true

  tags = {
    Name = var.TAG
  }
}

resource "aws_subnet" "publicSubnet1" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.PUBLIC_SUBNET1
  availability_zone = var.PUBLIC_SUBNET1_AZ
  tags = {
    Name = var.TAG
  }

  map_public_ip_on_launch = "true" 
}
resource "aws_subnet" "publicSubnet2" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.PUBLIC_SUBNET2
  availability_zone = var.PUBLIC_SUBNET2_AZ
  tags = {
    Name = var.TAG
  }

  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.PRIVATE_SUBNET1
  availability_zone = var.PRIVATE_SUBNET1_AZ

  tags = {
    Name = var.TAG
  }
}

resource "aws_subnet" "privateSubnet2" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.PRIVATE_SUBNET2
  availability_zone = var.PRIVATE_SUBNET2_AZ

  tags = {
    Name = var.TAG
  }
}

