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
