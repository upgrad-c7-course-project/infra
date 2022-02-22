resource "aws_instance" "bastion" {
  ami                         = var.ami-id
  instance_type               = var.ec2-type
  subnet_id                   = aws_subnet.public-subnet1.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name                    = var.pem-keyname

  tags = {
    Name = "101-bastion"
  }
}



resource "aws_instance" "jenkins" {
  ami                    = var.ami-id
  instance_type          = var.ec2-type
  subnet_id              = aws_subnet.private-subnet1.id
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name               = var.pem-keyname


  tags = {
    Name = "101-jenkins"
  }
}


resource "aws_instance" "app" {
  ami                    = var.ami-id
  instance_type          = var.ec2-type
  subnet_id              = aws_subnet.private-subnet1.id
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name               = var.pem-keyname


  tags = {
    Name = "101-app"
  }
}


