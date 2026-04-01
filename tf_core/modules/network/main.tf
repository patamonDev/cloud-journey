resource "azurerm_virtual_network" "main_vnet" {
  name = var.vnet_name
  address_space = [var.addy_space]
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "main_sn" {
  name = var.sn_name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes = [var.sn_prefix]
}
resource "azurerm_network_interface" "main_nic" {
  name = var.nic_name
  location = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.main_sn.id
    private_ip_address_allocation = "Dynamic"
  }
}