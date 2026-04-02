resource "azurerm_virtual_network" "main" {
  name = var.vnet_name
  location = var.location
  resource_group_name = var.rg_name
  address_space = var.address_list

  subnet {
    name = var.sn_name
    address_prefixes = var.sn_prefix
  }
  # subnet {
  #   name = "backend"
  #   address_prefixes = [ "10.0.2.0/16" ]
  # }
}