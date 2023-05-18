resource "aws_internet_gateway" "terraformIGW" {
  vpc_id = aws_vpc.terraformVpc.id

  tags = {
    Name = var.tag
  }
}

resource "aws_route_table" "publicTable" {
  vpc_id = aws_vpc.terraformVpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraformIGW.id
  }

  tags = {
    Name = var.tag
  }
}


resource "aws_route_table_association" "publicRouteAssociation" {
  subnet_id      = aws_subnet.publicSubnet1.id
  route_table_id = aws_route_table.publicTable.id
}

resource "aws_route_table_association" "publicRouteAssociation2" {
  subnet_id     = aws_subnet.publicSubnet2.id
  route_table_id = aws_route_table.publicTable.id
}
