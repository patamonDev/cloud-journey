module "vnet" {
  source = "../../modules/network"
  vnet_name = var.vnet_name
  address_list = var.address_list
  location = var.location
  rg_name = var.rg_name
  sn_name = var.sn_name
  sn_prefix = var.sn_prefix
}