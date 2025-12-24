data "azurerm_resources" "example" {
  resource_group_name = "glss"
}

output "print" {
    value = data.azurerm_resources.example
}