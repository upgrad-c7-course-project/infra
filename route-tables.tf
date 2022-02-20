# -- Public Route

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr-all
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "101-public-route"
  }
}



resource "aws_route_table_association" "rt-association-pub1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public-route.id
}


resource "aws_route_table_association" "rt-association-pub2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-route.id
}


# -- Private Route


resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.cidr-all
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "101-private-route"
  }
}



resource "aws_route_table_association" "rt-association-pri1" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.private-route.id
}


resource "aws_route_table_association" "rt-association-pri2" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private-route.id
}