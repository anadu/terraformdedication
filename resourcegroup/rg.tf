resource "azurerm_resource_group" "rg" {
    count = length(var.rg)
    name = var.rg[count.index]
    location =  "West Europe"
}


variable "rg" {
    default = ["East","West"]
}


provider "azurerm" {
  features {}
  subscription_id="a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}