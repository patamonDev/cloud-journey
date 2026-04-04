# Sets up the backend structure of TF
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "dev-rg" {
  name = var.name
}