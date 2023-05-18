variable "REGION" {
  type    = string
  default = "us-east-1"
}

variable "KEY_NAME" {
  type = string
}

variable "RSA_FILE_NAME" {
  type = string
}

variable "TAG" {
  type = string
}

variable "VPC_CIDR" {
  type = string
}

variable "PUBLIC_SUBNET1" {
  type = string
}

variable "PUBLIC_SUBNET2" {
  type = string
}

variable "PRIVATE_SUBNET1" {
  type = string
}

variable "PRIVATE_SUBNET2" {
  type = string
}

variable "PUBLIC_SUBNET1_AZ" {
  type = string
}

variable "PUBLIC_SUBNET2_AZ" {
  type = string
}

variable "PRIVATE_SUBNET1_AZ" {
  type = string
}

variable "PRIVATE_SUBNET2_AZ" {
  type = string
}

variable "AMI_ID" {
  type = string
}

variable "INSTANCE_TYPE" {
  type = string
}

variable "DB_STORAGE" {
  type = number
}

variable "DB_NAME" {
  type = string
}

variable "DB_ENGINE" {
  type = string
}

variable "ENGINE_VERSION" {
  type = string
}

variable "DB_INSTANCE_CLASS" {
  type = string
}

variable "PARAMETER_G_N_DB" {
  type = string
}

variable "DB_CLUSTER" {
  type = string
}

variable "DB_CACHE_ENGINE" {
  type = string
}

variable "DB_NODE_TYPE" {
  type = string
}

variable "NUM_CAHCE_NODES" {
  type = number
}

variable "CACHE_PARAMETER_GROUP_NAME" {
  type = string
}

variable "ENGINE_VERSION_CACHE" {
  type = string
}

variable "CACHE_PORT" {
  type = number
}

variable "USER_NAME" {
  type = string
}