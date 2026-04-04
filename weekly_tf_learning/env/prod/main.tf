module "vnet" {
  source = "../../modules/network"
  vnet_name = "prod-${var.vnet_name}"
  cidr_block = var.cidr_block
  location = data.azurerm_resource_group.prod-rg.location
  rg_name = data.azurerm_resource_group.prod-rg.name
  sn_name_one = var.sn_name_one
  sn_prefix_one = var.sn_prefix_one
  sn_name_two = var.sn_name_two
  sn_prefix_two = var.sn_prefix_two
}