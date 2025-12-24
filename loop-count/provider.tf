provider "azurerm" {
  features {}
  subscription_id="a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}

resource "null_resource" "test" {
   count = length(var.demo) 
   

}

variable "demo" {
 default = ["kishore","orange"]
}


resource "azurerm_resource_group" "rg" {
  name     = "test"
  location = "West Europe"

  tags = {
    name = "kishore-${count.index}"
  }
}


