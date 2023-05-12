terraform {
  backend "s3" {
    bucket         = "tf-state-iti"
    key            = "tf-state"
    region         = "us-east-1"
    dynamodb_table = "terraform"
  }

}