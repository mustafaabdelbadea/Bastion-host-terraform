resource "aws_nat_gateway" "NGW" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publicSubnet1.id
}
