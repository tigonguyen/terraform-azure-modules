output "current_rg_name" {
  value = azurerm_resource_group.main.name
}

output "current_rg_region" {
  value = azurerm_resource_group.main.location
}

output "current_nsg_id" {
  value = azurerm_network_security_group.main.id
}