# Arquivo: modules/aws-vpc/main.tf

resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "example-vpc"
  }
}

# Definindo sub-redes, gateways, etc., seguindo uma abordagem similar.
