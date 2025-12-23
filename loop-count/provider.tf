provider "azurerm" {
  features {}
  subscription_id="a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}


resource "null_resource" "empty"{
    count = 10
}