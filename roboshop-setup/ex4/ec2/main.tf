data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

#create frontend component
resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t3.nano"
  vpc_security_group_ids = ["sg-055e9d45bc8da8a4d"]
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