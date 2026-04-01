terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.11.4"
}
provider "azurerm" {
  features {}
}

locals {
    staging_env = "dev"
}

# Create random string for tfstate
resource "random_string" "resource_code" {
  length = 10
  special = false
  upper = false
}

# Create RG
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
  tags = {
    Environment = local.staging_env
  }
}

# Module that creates the VNet, subnet, and NIC for my RG resources
module "network_config" {
  source = "./modules/network"
  nic_name = "tf-core-nic"
  location = var.location
  addy_space = "10.17.0.0/16"
  vnet_name = "tf-core-vnet"
  sn_name = "tf-core-subnet"
  sn_prefix = "10.17.0.1/24"
}

# Create Storage Account
resource "azurerm_storage_account" "tf_core_storage" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    Environment = local.staging_env
  }

  depends_on = [ azurerm_resource_group.rg ]
}

# Create container inside of storage account
resource "azurerm_storage_container" "tfstate" {
  name = "tfstate"
  storage_account_name = azurerm_storage_account.tf_core_storage.name
  container_access_type = "private"
}