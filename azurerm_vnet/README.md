# Module Detail
***Note that this module may be deprecated as it does not give much more than the standard azurerm providers.***
## Description
This module help you to initialize your Azure virtual network before you develop your own bussiness infrastructure. You can find out the module's abilities with the check list below.
## Check list
- [x] Create a vNet
- [x] Create multiple subnets
- [ ] Link service endpoints to subnets
- [ ] Use the standard DDOS protection plan
- [ ] Specify a hub vNet resourceId to peer as a spoke vNet
- [ ] Specify a default route IP address to configure a Route Table associated with all subnets
## Prerequisites
| Provider | Source | Version |
| --- | --- | --- |
| `azurerm` | `hashicorp/azurerm` | >=2.46.0 |
## Usage
```
module "azurerm_vnet" {
  source              = "../azurerm_vnet"

  name                = "example_vnet"
  resource_group_name = "test_rg"
  subnet_list                = {
    AzureFirewallSubnet      = "10.0.0.0/26"
    GatewaySubnet            = "10.0.0.224/27"
  }
}

module "azurerm_vnet_1" {
  source              = "../azurerm_vnet"

  name                = "example_vnet_1"
  address_space       = [ "192.168.0.0/24" ]
  resource_group_name = module.azurerm_vnet.vnet["resource_group_name"]
}
```
## Arguments
| Name | Type | Description |
| --- | --- | --- |
| `name` | *string* | (Required) Name of the virtual network (vNet). |
| `resource_group_name` | *string* | (Required) Name of an specific resource group. |
| `location` | *string* | (Optional) Azure region where the vNet located. Default is existing resource group's region. |
| `address_space` | *list(string)* | (Optional) Assign the IPv4 address space for the virtual network in. Default is ["10.0.0.0/16"]. |
| `tags` | *map(string)* | (Optional) Tags for the vNet. Default is existing resource group's tags. |
| `subnet_list` | *map(string)* | (Optional) List of subnets with the form is SubnetName:IPrange.|
## Attributes
| Name | Output Key | Type | Description |
| --- | --- | --- | --- |
| `vnet` | `id` | *string* | ID of the virtual network (vNet). |
| | `name` | *string* | Name of the virtual network (vNet). |
| | `subscription_id` | *string* | Subscription ID where the vNet located. |
| | `resource_group_name` | *string* | Resource group name where the vNet located. |
| | `address_space` | *list(string)* | List of defined address space |
## References
- https://github.com/terraform-azurerm-modules/terraform-azurerm-vnet
## Author
- **[Thanh, Dinh Nguyen](https://github.com/tigonguyen)** 