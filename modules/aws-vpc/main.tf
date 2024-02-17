# Arquivo: modules/aws-vpc/main.tf

resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example-subnet" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-aula-03"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "example-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
}

resource "aws_route_table_association" "example-rt-association" {
  subnet_id = aws_subnet.example-subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "allow_access" {
  name = "allow_access"
  description = "Allow inbound traffic"
  vpc_id = aws_vpc.example.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

# Definindo sub-redes, gateways, etc., seguindo uma abordagem similar.
