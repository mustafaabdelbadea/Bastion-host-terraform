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
