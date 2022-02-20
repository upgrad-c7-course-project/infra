# resource "aws_instance" "bastion" {
#   # ami           = data.aws_ami.ubuntu.id. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#   ami           = "ami-04505e74c0741db8d"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.public-subnet1.id
#   vpc_security_group_ids = [aws_security_group.bastion_sg.id]
#   associate_public_ip_address = true
#   key_name = "upgrad"

#   tags = {
#     Name = "101-bastion"
#   }
# }



# resource "aws_instance" "jenkins" {
#   # ami           = data.aws_ami.ubuntu.id. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#   ami           = "ami-04505e74c0741db8d"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.private-subnet1.id
#   vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
#   key_name = "upgrad"

#   tags = {
#     Name = "101-jenkins"
#   }
# }


# resource "aws_instance" "app" {
#   # ami           = data.aws_ami.ubuntu.id. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#   ami           = "ami-04505e74c0741db8d"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.private-subnet1.id
#   vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
#   key_name = "upgrad"

#   tags = {
#     Name = "101-app"
#   }
# }


