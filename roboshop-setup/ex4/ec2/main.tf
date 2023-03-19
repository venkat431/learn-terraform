data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

#create frontend component
resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_id
  tags = {
    Name = var.component
  }
}

#create Route 53 for frontend
resource "aws_route53_record" "record" {
  zone_id = "Z08931683BP7DV5GJ0PAA"
  name    = "${var.component}.devops-practice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

variable "component" {}
variable "instance_type" {}
variable "sg_id" {}
