#create frontend component
resource "aws_instance" "frontend" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t3.nano"
  vpc_security_group_ids = ["sg-055e9d45bc8da8a4d"]
  tags = {
    Name = "frontend"
  }
}
#create Route 53 for frontend
resource "aws_route53_record" "frontend" {
  zone_id = "Z08931683BP7DV5GJ0PAA"
  name    = "frontend.devops-practice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
#create mongodb component
resource "aws_instance" "mongodb" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t3.nano"
  vpc_security_group_ids = ["sg-055e9d45bc8da8a4d"]
  tags = {
    Name = "mongodb"
  }
}
#create route 53 for mongodb
resource "aws_route53_record" "mongodb" {
  zone_id = "Z08931683BP7DV5GJ0PAA"
  name    = "mongodb.devops-practice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}
