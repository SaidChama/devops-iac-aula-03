module "my_vpc" {
    source = "../aws-vpc"
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = file("~/.ssh/aula-03-ec2-key.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Ubuntu / Canonical owner ID
}

resource "aws_instance" "web" {
  count                         = 3
  ami                           = data.aws_ami.ubuntu.id
  instance_type                 = var.instance_type
  key_name                      = aws_key_pair.deployer_key.key_name
  subnet_id                     = module.my_vpc.aws_subnet
  vpc_security_group_ids        = [module.my_vpc.aws_security_group]
  associate_public_ip_address   = true
  user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt-get install -y openjdk-17-jdk apache2
      
      # Habilitar e iniciar o Apache Web Server
      systemctl enable apache2
      systemctl start apache2
      
      # Verificar se o Java foi instalado corretamente
      java -version
      EOF

  tags = {
    Name = "WebServer-${count.index}"
  }
}