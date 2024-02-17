# variable "ami" {
#     description = "ubuntu ami"
#     default = data.aws_ami.ubuntu.id
# }


variable "instance_type" {
  description = "Instance Type"
  type = string
  default = "t2.micro"
}
