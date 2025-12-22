module "src" {
  source = "./modules/sample"
  x = var.x
  y = var.y
}