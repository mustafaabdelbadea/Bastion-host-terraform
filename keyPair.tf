resource "aws_key_pair" "TF-key" {
  key_name   = var.KEY_NAME
  public_key = tls_private_key.terra-labs.public_key_openssh
}

resource "tls_private_key" "terra-labs" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "pvKey" {
  content  = tls_private_key.terra-labs.private_key_pem
  filename = var.RSA_FILE_NAME
}

resource "aws_secretsmanager_secret" "keySecret" {
  name                    = "secret_keys_aws"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "secrets" {
  secret_id     = aws_secretsmanager_secret.keySecret.id
  secret_string = jsonencode({ "public_key" = tls_private_key.terra-labs.public_key_openssh, "private_key" = tls_private_key.terra-labs.private_key_pem })
}


locals {
  private_key = nonsensitive(jsondecode(aws_secretsmanager_secret_version.secrets.secret_string))["private_key"]
  public_key  = nonsensitive(jsondecode(aws_secretsmanager_secret_version.secrets.secret_string))["public_key"]
}
