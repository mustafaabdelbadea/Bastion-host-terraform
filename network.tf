module "network" {
  source             = "./network"
  tag                = var.TAG
  vpc_cidr           = var.VPC_CIDR
  public_subnet1     = var.PUBLIC_SUBNET1
  public_subnet2     = var.PUBLIC_SUBNET2
  private_subnet1    = var.PRIVATE_SUBNET1
  private_subnet2    = var.PRIVATE_SUBNET2
  public_subnet1_az  = var.PUBLIC_SUBNET1_AZ
  public_subnet2_az  = var.PUBLIC_SUBNET2_AZ
  private_subnet1_az = var.PRIVATE_SUBNET1_AZ
  private_subnet2_az = var.PRIVATE_SUBNET2_AZ
}