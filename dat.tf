terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id= "a3bdf793-32e4-4604-aa40-ad21d74b1bdd"
}
  

  data "azurerm_resource_group" "learn" {
    name="project-setup-1"
  }

  output "resourcegroupread" {
    value=data.azurerm_resource_group.learn
  } 

  data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "terraformvm-vnet"
  resource_group_name  = "project-setup-1"
}

output "subnet_id" {
  value = data.azurerm_subnet.example.id
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = data.azurerm_resource_group.learn.location
  resource_group_name = data.azurerm_resource_group.learn.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}