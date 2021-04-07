# Module Detail
## Description
This module help you to initialize your Azure virtual network before you develop your own bussiness infrastructure. You can find out the module's abilities with the check list below.
## Check list
- [ ] Create a vNet with any number of subnets
- [ ] Use the standard DDOS protection plan
- [ ] Add service endpoints to subnets
- [ ] Specify a hub vNet resourceId to peer as a spoke vNet
- [ ] Specify a default route IP address to configure a Route Table associated with all subnets
## Example usage
## Inputs
| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the node pool. |
| `vm_size` | `string` | The size of the VMs in the node pool. |
| `node_count` | `number` | The number of nodes. |