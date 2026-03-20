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

# Create RG
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
  tags = {
    Environment = local.staging_env
  }
}

# Create Storage Account
resource "azurerm_storage_account" "tf_core_storage" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = local.staging_env
  }

  depends_on = [ azurerm_resource_group.rg ]
}