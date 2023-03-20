#create Route 53 for frontend
resource "aws_route53_record" "record" {
  zone_id = "Z08931683BP7DV5GJ0PAA"
  name    = "${var.component}.devops-practice.tech"
  type    = "A"
  ttl     = 30
  records = [var.ec2_private_ip]
}

variable "component" {}
variable "ec2_private_ip" {}
