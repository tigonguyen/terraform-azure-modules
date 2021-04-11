variable "resource_group_name" {
  type        = string
  description = "(Required) Name of an specific resource group."
}

variable "location" {
  type        = string
  description = "(Optional) Azure region where the vNet located. Default is existing resource group's region."
  default     = null
}

variable "name" {
  type        = string
  description = "(Required) Name of the virtual network (vNet)."
}

variable "address_space" {
  type        = list(string)
  description = "(Optional) Assign the IPv4 address space for the virtual network in. Default is [\"10.0.0.0/16\"]."
  default     = ["10.0.0.0/16"]
}

variable "tags" {
  type        = map
  description = "Map of key value pairs for the resource tagging."
  default     = null
}

variable "subnet_list" {
  type        = map(string)
  description = "List of subnet with the form is SubnetName:IP range"
  default     = {} 
}

variable "ddos" {
  type        = bool
  description = "Boolean to deploy [Azure DDOS Protection](https://azure.microsoft.com/services/ddos-protection/). Default: false."
  default     = false
}