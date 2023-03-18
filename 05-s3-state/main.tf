terraform {
  backend "s3" {
    bucket = "terraform-31"
    key    = "05-s3-state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t3.nano"
  vpc_security_group_ids = ["sg-055e9d45bc8da8a4d"]
  tags = {
    Name = "test"
  }
}