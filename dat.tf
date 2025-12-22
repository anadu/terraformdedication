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
  

  data "azurerm_resource_group" "learn1" {
    name="test"
  }

  output "resourcegroupread" {
    value=data.azurerm_resource_group.learn1
  } 

  data "azurerm_resource_group" "learn" {
    name="project-setup-1"
  }

  data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "learnterraform"
  resource_group_name  = "test"
}

output "subnet_id" {
  value = data.azurerm_subnet.example.id
}

resource "azurerm_network_interface" "main" {
  name                = "network-nic"
  location            = data.azurerm_resource_group.learn1.location
  resource_group_name = data.azurerm_resource_group.learn1.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_machine" "main" {
  name                  = "new-vm"
  location              = data.azurerm_resource_group.learn1.location
  resource_group_name   = data.azurerm_resource_group.learn1.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}