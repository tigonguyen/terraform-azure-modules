data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = var.location == null ? data.azurerm_resource_group.main.location : var.location
  tags                = var.tags == null ? data.azurerm_resource_group.main.tags : var.tags
  address_space       = var.address_space
}