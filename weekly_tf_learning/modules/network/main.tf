resource "azurerm_virtual_network" "main" {
  name = var.vnet_name
  location = var.location
  resource_group_name = var.rg_name
  address_space = var.cidr_block

  subnet {
    name = var.sn_name_one
    address_prefixes = var.sn_prefix_one
  }

  subnet {
    name = var.sn_name_two
    address_prefixes = var.sn_prefix_two
  }
}