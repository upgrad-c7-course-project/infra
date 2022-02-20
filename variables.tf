variable "terraform-backend-bucket" {
  default = "101-terraform-backend"
}

variable "aws-region" {
  default = "us-east-1"
}


variable "aws-region-az-a" {
  default = "us-east-1a"
}

variable "aws-region-az-b" {
  default = "us-east-1b"
}

variable "pem-keyname" {
  default = "upgrad"
}

# CIDRs/Ips
variable "vpc-cidr-block" {
  default = "10.12.0.0/16"
}


variable "cidr-all" {
  default = "0.0.0.0/0"
}



# EC2
variable "ec2-type" {
  default = "t2.micro"
}


variable "ami-id" {
  default = "ami-04505e74c0741db8d"
}



