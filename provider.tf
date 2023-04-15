variable "region" {
    default = "us-east-1"
}
  provider "aws" {
    region = var.region
  }

terraform {
  backend "s3" {
    bucket = "tf-state-iti"
    key    = "tf-state-day1"
    region = "us-east-1"
    dynamodb_table  = "terraform"
  }
  
}


