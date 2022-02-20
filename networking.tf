# VPC

resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr-block
  enable_dns_hostnames = true
  tags = {
    Name = "101-vpc"
  }
}


# subnets

resource "aws_subnet" "public-subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.12.1.0/24"
  availability_zone = var.aws-region-az-a
  # map_public_ip_on_launch = true
  tags = {
    Name = "101-public-subnet1"
  }
}


resource "aws_subnet" "private-subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.12.2.0/24"
  availability_zone = var.aws-region-az-a
  tags = {
    Name = "101-private-subnet1"
  }
}



resource "aws_subnet" "public-subnet2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.12.3.0/24"
  availability_zone = var.aws-region-az-b
  tags = {
    Name = "101-public-subnet2"
  }
}


resource "aws_subnet" "private-subnet2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.12.4.0/24"
  availability_zone = var.aws-region-az-b
  tags = {
    Name = "101-private-subnet2"
  }
}


# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "101-igw"
  }
}


# NAT
resource "aws_eip" "ngw-ip" {
  vpc      = true

  tags = {
    Name = "101-ngw-ip"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-ip.id
  subnet_id     = aws_subnet.public-subnet1.id

  tags = {
    Name = "101-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

