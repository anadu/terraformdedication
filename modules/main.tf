module "src" {
  source = "./sample"
  x = var.x
  y = var.y
}

variable "x" {}

variable "y" {}