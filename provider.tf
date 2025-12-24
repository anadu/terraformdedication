provider "azurerm" {
  features {}
  subscription_id="a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}

data "azurerm_resources" "example" {
   for_each = var.rg 
   resource_group_name = each.value["name"]
}


variable "rg" {
    default = {
       resource_group = {
          name = "glss"
        } 
       resource_groups = {
          name = "clss"
       }
    }
}

output "print" {
    output = data.azurerm_resources.example
}



