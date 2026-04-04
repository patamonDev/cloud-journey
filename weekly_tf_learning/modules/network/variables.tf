variable "vnet_name" {
  type = string
  description = "Name for environment VNet"
  validation {
    condition = can(regex("^[a-zA-Z0-9]", var.vnet_name))
    error_message = "Invalid VNet name entered. Must start and end with a letter or number"
  }
}

variable "cidr_block" {
  type = list(string)
  description = "Address space for your VNet"
}

variable "location" {
  type = string
  description = "RG location"
}

variable "rg_name" {
  type = string
  description = "RG name"
}

variable "sn_name_one" {
  type = string
  description = "SN Name"
}

variable "sn_prefix_one" {
  type = list(string)
  description = "SN Prefix"
}

variable "sn_name_two" {
  type = string
  description = "SN Name for the second subnet"
}

variable "sn_prefix_two" {
  type = list(string)
  description = "SN Prefix for the second subnet"
}