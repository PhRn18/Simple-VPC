resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.terraform-vpc.id
    route {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id
    }
    tags = {
        "Name"="public-route-table"
    }
}
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    "Name" = "private-route-table"
  }
}
resource "aws_route_table_association" "public_subnet_public_route_table" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet.id
}
resource "aws_route_table_association" "private_subnet_private_route_table" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-subnet.id
}