module "ec2" {
  for_each      = var.instances
  source        = "./ec2"
  component     = each.value["name"]
  instance_type = each.value["type"]
}

module "sg" {
  source = "./sg"
}

variable "instances" {
  default = {
    frontend = {
      name = "frontend"
      type = "t3.nano"
    }
    mongodb = {
      name = "mongodb"
      type = "t3.nano"
    }
  }
}
