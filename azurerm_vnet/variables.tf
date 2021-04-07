variable "resource_group_name" {
  type        = string
  description = "(Required) Name of an specific resource group."
}

variable "location" {
  type        = string
  description = "(Optional) Azure region where the vNet located. Default is existing resource group's region."
  default     = null
}

variable "vnet_name" {
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