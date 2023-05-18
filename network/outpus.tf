output "vpc_id" {
  value = aws_vpc.terraformVpc.id
}

output "vpc_cidr" {
  value = aws_vpc.terraformVpc.cidr_block
}

output "pub_subnet1" {
  value= aws_subnet.publicSubnet1.id
}

output "pub_subnet2" {
  value= aws_subnet.publicSubnet2.id
}

output "prv_subnet1" {
  value= aws_subnet.privateSubnet1.id
}

output "prv_subnet2" {
  value= aws_subnet.privateSubnet2.id
}

output "rds_subnet" {
  value = aws_db_subnet_group.rds_subnet.id
}

output "db_cache_subnet" {
  value = aws_elasticache_subnet_group.db_cache_subnet.id
}