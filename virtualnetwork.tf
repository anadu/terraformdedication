resource "azurerm_resource_group" "rg" {
    name = "dedication"
    location =  "West Europe"
}

resource "azurerm_virtual_network" vnet {
    name = "vnet"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space       = ["10.0.0.0/16"]
}