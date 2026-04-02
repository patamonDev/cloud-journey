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

data "azurerm_resource_group" "bootstrap_rg" {
  name = "dev-rg-9254"
}

module "dev_env" {
  source = "./env/dev"

  vnet_name = "dev-vnet-121"
  address_list = ["10.15.0.0/16"]
  location = data.azurerm_resource_group.bootstrap_rg.location
  rg_name = data.azurerm_resource_group.bootstrap_rg.name
  sn_name = "frontend"
  sn_prefix = ["10.15.0.0/24"]
}

module "prod_env" {
  source = "./env/prod"

  vnet_name = "prod-vnet"
  address_list = ["10.16.0.0/16"]
  location = data.azurerm_resource_group.bootstrap_rg.location
  rg_name = data.azurerm_resource_group.bootstrap_rg.name
  sn_name = "frontend"
  sn_prefix = ["10.16.0.0/24"]
}