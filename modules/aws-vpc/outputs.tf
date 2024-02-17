# Arquivo: modules/aws-vpc/outputs.tf

output "vpc_id" {
  value = aws_vpc.example.id
  description = "The ID of the VPC"
}

output "aws_subnet" {
  value = aws_subnet.example-subnet.id
  description = "Subnet ID"
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.example.id
  description = "Internet Gateway ID"
}

output "aws_route_table" {
  value = aws_route_table.rt.id
  description = "Route Table ID"
}

output "aws_route_table_association" {
  value = aws_route_table_association.example-rt-association.id
  description = "Route Table Association ID"
}

output "aws_security_group" {
  value = aws_security_group.allow_access.id
  description = "Security Group ID"
}


