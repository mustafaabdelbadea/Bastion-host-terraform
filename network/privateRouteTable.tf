resource "aws_route_table" "privateRouteTable" {
  vpc_id = aws_vpc.terraformVpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NGW.id
  }
  tags = {
    Name = var.tag
  }
}

resource "aws_route_table_association" "rt_associate_private" {
  subnet_id      = aws_subnet.privateSubnet1.id
  route_table_id = aws_route_table.privateRouteTable.id
}

resource "aws_route_table_association" "rt_associate_private2" {
  subnet_id      = aws_subnet.privateSubnet2.id
  route_table_id = aws_route_table.privateRouteTable.id
}
