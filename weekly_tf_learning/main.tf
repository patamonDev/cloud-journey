terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
  required_version = ">= 1.11.4"
}

provider "azurerm" {
  features {}
}