variable "location" {
  type = string
  description = "Azure region"
  default = "eastus2"
}

variable "resource_group_name" {
  type = string
  description = "Azure RG name"
  default = "temp-rg"
}

variable "storage_account_name" {
  type = string
  description = "Azure storage account name"
  default = "myStorage"
}

variable "nic_name" {
  type = string
  description = "NIC Name"
  default = "tempnicname"
}

variable "addy_space" {
  type = string
  description = "Address Space for VNet"
}

variable "vnet_name" {
  type = string
  description = "VNet name"
}

variable "sn_name" {
  type = string
  description = "Subnet Name"
}

variable "sn_prefix" {
  type = string
  description = "Subnet prefix (range)"
}