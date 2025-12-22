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