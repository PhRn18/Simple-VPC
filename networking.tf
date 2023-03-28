resource "aws_vpc" "terraform-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "terraform-vpc"
  }
}
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    "Name" = "vpc-internet-gateway"
  }
}
resource "aws_subnet" "public-subnet" {
    cidr_block = "10.1.1.0/24"
    vpc_id = aws_vpc.terraform-vpc.id
    map_public_ip_on_launch = true
    tags = {
      "Name" = "public-subnet"
    }
}
resource "aws_subnet" "private-subnet" {
    cidr_block = "10.1.2.0/24"
    vpc_id = aws_vpc.terraform-vpc.id
    tags = {
      "Name" = "private-subnet"
    }
}