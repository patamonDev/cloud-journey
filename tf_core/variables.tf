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