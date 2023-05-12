resource "aws_instance" "publicInstance1" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE

  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = module.network.pub_subnet1
  associate_public_ip_address = true
  key_name                    = var.KEY_NAME


  user_data = <<-EOF
   #!/bin/bash
    sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Public $(hostname -f)</div></body></html>" > /var/www/html/index.html
   echo '${local.private_key}' > /home/ec2-user/${var.RSA_FILE_NAME}
   chmod 400 /home/ec2-user/TF-key.pem
   EOF
}

resource "aws_instance" "publicInstance2" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE

  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = module.network.pub_subnet2
  associate_public_ip_address = true
  key_name                    = var.KEY_NAME

  user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Public $(hostname -f)</div></body></html>" > /var/www/html/index.html
   echo '${local.private_key}' > /home/ec2-user/${var.RSA_FILE_NAME}
   chmod 400 /home/ec2-user/TF-key.pem
   EOF

}


resource "aws_instance" "privateInstance1" {
  ami                         = var.AMI_ID
  instance_type               = var.INSTANCE_TYPE
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh_custom.id]
  subnet_id                   = module.network.prv_subnet1
  key_name                    = var.KEY_NAME

  user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install -y mariadb-server
   sudo systemctl enable mariadb
   sudo systemctl start mariadb
   EOF

}

resource "aws_instance" "privateInstance2" {
  ami                         = var.AMI_ID
  instance_type               = var.INSTANCE_TYPE
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh_custom.id]
  subnet_id                   = module.network.prv_subnet2
  key_name                    = var.KEY_NAME

  user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install -y mariadb-server
   sudo systemctl enable mariadb
   sudo systemctl start mariadb
   EOF

}


resource "null_resource" "get_instance_ip" {
  depends_on = [
    aws_instance.publicInstance1
  ]
  provisioner "local-exec" {
    command = "echo ${aws_instance.publicInstance1.public_ip} >> public_ips.txt"
  }
}
