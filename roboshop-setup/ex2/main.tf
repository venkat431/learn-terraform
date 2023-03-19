data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

#create frontend component
resource "aws_instance" "frontend" {
  count                  = length(var.instances)
  ami                    = "ami-0089b8e98cd95257d"
  instance_type          = "t3.nano"
  vpc_security_group_ids = ["sg-055e9d45bc8da8a4d"]
  tags                   = {
    Name = var.instances[count.index]
  }
}

variable "instances" {
  default = ["frontend","catalogue","mongodb"]
}