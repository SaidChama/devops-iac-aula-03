# Arquivo: modules/aws-vpc/outputs.tf

output "vpc_id" {
  value = aws_vpc.example.id
  description = "The ID of the VPC"
}
