module "vm" {
  source = "./vm"
  component = "cart"
}

module "frontend" {
  source = "./vm"
  component = fortend
}
