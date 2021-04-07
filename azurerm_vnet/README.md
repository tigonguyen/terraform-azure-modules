# Module Detail
## Description
This module help you to initialize your Azure virtual network before you develop your own bussiness infrastructure. You can find out the module's abilities with the check list below.
## Check list
- [x] Create a vNet
- [ ] Create multiple subnets
- [ ] Use the standard DDOS protection plan
- [ ] Add service endpoints to subnets
- [ ] Specify a hub vNet resourceId to peer as a spoke vNet
- [ ] Specify a default route IP address to configure a Route Table associated with all subnets
## Prerequisites
| Provider | Source | Version |
| --- | --- | --- |
| `azurerm` | `hashicorp/azurerm` | >=2.46.0 |
## Usage
```
# Configure the Hashicorp Vault provider
provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to use $VAULT_ADDR and $VAULT_TOKEN
}

data "vault_generic_secret" "service_principle" {
  path = "azure/service_test"
}

provider "azurerm" {
  features {}
  subscription_id = data.vault_generic_secret.service_principle.data["subscription"]
  client_id       = data.vault_generic_secret.service_principle.data["appId"]
  client_secret   = data.vault_generic_secret.service_principle.data["password"]
  tenant_id       = data.vault_generic_secret.service_principle.data["tenant"]
}

module "azurerm_vnet" {
  source              = "../azurerm_vnet"

  vnet_name           = "example_vnet"
  resource_group_name = "test_rg"
}

module "azurerm_vnet_1" {
  source              = "../azurerm_vnet"

  vnet_name           = "example_vnet"
  address_space       = [ "192.168.0.0/24" ]
  resource_group_name = module.azurerm_vnet.vnet["resource_group_name"]
}
```
## Arguments
| Name | Type | Description |
| --- | --- | --- |
| `vnet_name` | `string` | (Required) Name of the virtual network (vNet). |
| `resource_group_name` | `string` | (Required) Name of an specific resource group. |
| `location` | `string` | (Optional) Azure region where the vNet located. Default is existing resource group's region. |
| `address_space` | `list(string)` | (Optional) Assign the IPv4 address space for the virtual network in. Default is ["10.0.0.0/16"]. |
| `tags` | `map` | (Optional) Tags for the vNet. Default is existing resource group's tags. |
## Attributes
| Name | Type | Description |
| --- | --- | --- |
| `id` | `string` | ID of the virtual network (vNet). |
| `name` | `string` | Name of the virtual network (vNet). |
| `subscription_id` | `string` | Subscription ID where the vNet located. |
| `resource_group_name` | `string` | Resource group name where the vNet located. |
| `address_space` | `list(string)` | List of defined address space |
## References
- https://github.com/terraform-azurerm-modules/terraform-azurerm-vnet
## Author
- **[Thanh, Dinh Nguyen](https://github.com/tigonguyen)** 