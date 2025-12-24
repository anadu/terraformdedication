provider "azurerm" {
  features {}
  subscription_id="a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}

resource "local_file" "foo" {
  for_each = var.map  
  content  = each.value
  filename = "tmp/${each.key}"
}

variable "map" {
  default = {
    name ="kishore"
    course = "devops"
  }
}



