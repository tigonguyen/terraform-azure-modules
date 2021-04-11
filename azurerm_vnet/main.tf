data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_client_config" "main" {}

resource "azurerm_virtual_network" "main" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = var.location == null ? data.azurerm_resource_group.main.location : var.location
  tags                = var.tags == null ? data.azurerm_resource_group.main.tags : var.tags
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name

  for_each             = var.subnet_list
  name                 = each.key
  address_prefixes     = flatten([each.value])
}