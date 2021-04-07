  
terraform {
  required_providers {
    azurerm = ">= 2.8.0" // For move to address_prefixes
  }
}

# Create resource group
resource "azurerm_resource_group" "main" {
  name     = "${var.prefix_name}_rg" # resource group name
  location = var.rg_region # Azure region
}

# Create VNET
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix_name}_vnet" 
  location            = var.rg_region  # Azure region
  resource_group_name = azurerm_resource_group.main.name # resource group name
  address_space       = var.vnet_ip_range
}