data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

#create frontend component
resource "aws_instance" "instance" {
  for_each                  = each.instances
  ami                    = "ami-0089b8e98cd95257d"
  instance_type          = each.type
  vpc_security_group_ids = ["sg-055e9d45bc8da8a4d"]
  tags                   = {
    Name = each.name
    }
  }
}

variable "instances" {
  default = {
    frontend = {
      name = frontend
      type = "t3.nano"
    }
    mongodb = {
      name = mongodb
      type = "t3.nano"
    }
  }
}
