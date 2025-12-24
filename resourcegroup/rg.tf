resource "azurerm_resource_group" "rg" {
    count = length(var.rg)
    name = new"${var.component[count.index]}"
    location =  "West Europe"
}


variable "rg" {
    default = ["East US","West Europe"]
}