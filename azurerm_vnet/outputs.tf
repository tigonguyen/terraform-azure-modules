output "vnet" {
  value = {
    id                  = azurerm_virtual_network.main.id
    subscription_id     = data.azurerm_client_config.main.subscription_id
    resource_group_name = azurerm_virtual_network.main.resource_group_name
    name                = azurerm_virtual_network.main.name
    address_space       = azurerm_virtual_network.main.address_space
  }
}