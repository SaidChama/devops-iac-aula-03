module "my_vpc" {
  source = "./modules/aws-vpc"
  cidr_block = "10.0.0.0/16"
}