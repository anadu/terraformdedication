data "azurerm_resource_group" "example" {
  name = "test"
}

output "test" {
    value = data.azurerm_resource_group.example
}