resource "aws_security_group" "allow_ssh" {
  name        = "Allow ssh"
  description = "Allow ssh inbound traffic from anywhere"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    description      = "ssh from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
resource "aws_security_group" "allow_ssh_from_public_subnet" {
    name        = "Allow ssh private subnet"
    description = "Allow ssh inbound traffic from public subnet"
    vpc_id      = aws_vpc.terraform-vpc.id
    ingress{
        description = "ssh from public subnet"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [aws_subnet.public-subnet.cidr_block]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [aws_subnet.public-subnet.cidr_block]
    }
  
}