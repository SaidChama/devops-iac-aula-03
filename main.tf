provider "aws" {
  region = "us-east-1"
}

module "my-ec2" {
  source = "./modules/aws-ec2"
  instance_type = "t2.micro"
}