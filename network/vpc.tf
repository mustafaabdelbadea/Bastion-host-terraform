resource "aws_vpc" "terraformVpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.tag
  }
}

resource "aws_subnet" "publicSubnet1" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.public_subnet1
  availability_zone = var.public_subnet1_az
  tags = {
    Name = var.tag
  }

  map_public_ip_on_launch = "true"
}
resource "aws_subnet" "publicSubnet2" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.public_subnet2
  availability_zone = var.public_subnet2_az
  tags = {
    Name = var.tag
  }

  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.private_subnet1
  availability_zone = var.private_subnet1_az

  tags = {
    Name = var.tag
  }
}

resource "aws_subnet" "privateSubnet2" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = var.private_subnet2
  availability_zone = var.private_subnet2_az

  tags = {
    Name = var.tag
  }
}

resource "aws_db_subnet_group" "rds_subnet" {
  subnet_ids = [aws_subnet.privateSubnet1.id, aws_subnet.privateSubnet2.id]

  tags = {
    Name = var.tag
  }
}

resource "aws_elasticache_subnet_group" "db_cache_subnet" {
  name       = "my-cache-subnet"
  subnet_ids = [aws_subnet.privateSubnet1.id]
}
