resource "aws_db_instance" "rds" {
  db_subnet_group_name   = module.network.rds_subnet
  allocated_storage      = var.DB_STORAGE
  db_name                = var.DB_NAME
  engine                 = var.DB_ENGINE
  engine_version         = var.ENGINE_VERSION
  instance_class         = var.DB_INSTANCE_CLASS
  username               = var.USER_NAME
  password               = local.db_password
  parameter_group_name   = var.PARAMETER_G_N_DB
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}


resource "aws_elasticache_cluster" "db_cache" {
subnet_group_name    = module.network.db_cache_subnet
  cluster_id           = var.DB_CLUSTER
  engine               = var.DB_CACHE_ENGINE
  node_type            = var.DB_NODE_TYPE
  num_cache_nodes      = var.NUM_CAHCE_NODES
  parameter_group_name = var.CACHE_PARAMETER_GROUP_NAME
  engine_version       = var.ENGINE_VERSION_CACHE
  port                 = var.CACHE_PORT
  security_group_ids   = [aws_security_group.cluster-sg.id]


}

