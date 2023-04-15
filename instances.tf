resource "aws_instance" "publicInstance1" {
  ami           = "ami-06e46074ae430fba6"
  instance_type = "t2.micro"

  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = aws_subnet.publicSubnet1.id
  associate_public_ip_address = true
  key_name                    = "TF-key"

  user_data = <<-EOF
   #!/bin/bash
    sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Public $(hostname -f)</div></body></html>" > /var/www/html/index.html
   echo '${local.private_key}' > /home/ec2-user/TF-key.pem
   chmod 400 /home/ec2-user/TF-key.pem
   EOF
}

resource "aws_instance" "publicInstance2" {
  ami           = "ami-06e46074ae430fba6"
  instance_type = "t2.micro"

  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = aws_subnet.publicSubnet2.id
  associate_public_ip_address = true
  key_name                    = "TF-key"

  user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Public $(hostname -f)</div></body></html>" > /var/www/html/index.html
   echo '${local.private_key}' > /home/ec2-user/TF-key.pem
   chmod 400 /home/ec2-user/TF-key.pem
   EOF

}


resource "aws_instance" "privateInstance1" {
  ami                         = "ami-06e46074ae430fba6"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh_custom.id]
  subnet_id                   = aws_subnet.privateSubnet1.id
  key_name                    = "TF-key"

  user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Private $(hostname -f)</div></body></html>" > /var/www/html/index.html
         echo '${local.private_key}' > /home/ec2-user/TF-key.pem


   EOF

}

resource "aws_instance" "privateInstance2" {
  ami                         = "ami-06e46074ae430fba6"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh_custom.id]
  subnet_id                   = aws_subnet.privateSubnet1.id
  key_name                    = "TF-key"

  user_data = <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Private $(hostname -f)</div></body></html>" > /var/www/html/index.html
         echo '${local.private_key}' > /home/ec2-user/TF-key.pem
   EOF

}
