
# resource "aws_security_group" "bastion_sg" {
#   name        = "101-bastion_sg"
#   description = "Allow self ip to ssh"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["71.204.191.226/32"]

#     # TODO:   USE SELF IP VIA a script
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "101-bastion_sg"
#   }
# }



# resource "aws_security_group" "private_instance_sg" {
#   name        = "101-private_instance_sg"
#   description = "Allow all incoming traffic from within VPC and all egress"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["10.12.0.0/16"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "101-private_instance_sg"
#   }
# }



# resource "aws_security_group" "public_web_sg" {
#   name        = "101-public_web_sg"
#   description = "Allow incoming to port 80 from self IP and all egress"
#   vpc_id      = aws_vpc.main.id

  # cidr_blocks = ["${chomp(data.http.myip.body)}/32"]

#   ingress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["71.204.191.226/32"]

#     # TODO:   USE SELF IP VIA a script
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "101-public_web_sg"
#   }
# }