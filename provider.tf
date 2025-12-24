provider "azurerm" {
  features {}
  subscription_id="a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}

data "azurerm_resources" "example" {
  resource_group_name = "glss"
}

output "print" {
    value = data.azurerm_resources.example
}