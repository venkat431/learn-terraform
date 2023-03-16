variable "sample" {
  default = "Var Hello World"
}

output "sample" {
  value = var.sample
}