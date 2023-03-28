resource "aws_instance" "public-instance" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  key_name = "aws-server"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  associate_public_ip_address = true
  tags = {
    "Name" = "ec2-publica"
  }
}
resource "aws_instance" "private-instance" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    key_name = "aws-server"
    subnet_id = aws_subnet.private-subnet.id
    vpc_security_group_ids = [ aws_security_group.allow_ssh_from_public_subnet.id ]
    associate_public_ip_address = false
    tags = {
      "Name" = "ec2-privada"
    }
}