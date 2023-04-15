resource "aws_vpc" "terraformVpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "publicSubnet1" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "terraform"
  }

  map_public_ip_on_launch = "true" 
}
resource "aws_subnet" "publicSubnet2" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "terraform"
  }

  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "privateSubnet2" {
  vpc_id            = aws_vpc.terraformVpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "terraform"
  }
}

