output "vnet" {
  value = {
    id                  = azurerm_virtual_network.main.id
    subscription_id     = data.azurerm_client_config.main.subscription_id
    resource_group_name = azurerm_virtual_network.main.resource_group_name
    name                = azurerm_virtual_network.main.name
    address_space       = azurerm_virtual_network.main.address_space
  }
}

output "subnets" {
  value = {
    for subnet, address_prefix in var.subnets :
    subnet => {
      name              = subnet
      id                = azurerm_subnet.subnet[subnet].id
      address_prefix    = address_prefix
      # nsg_id            = contains(keys(var.nsgs), subnet) ? var.nsgs[subnet] : ""
      # service_endpoints = contains(keys(var.service_endpoints), subnet) ? var.service_endpoints[subnet] : []
    }
  }
}