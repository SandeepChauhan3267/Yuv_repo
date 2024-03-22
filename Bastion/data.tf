data "azurerm_subnet" "example" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "YuvVirtual-network"
  resource_group_name  = "Yuv_rg1"
}

data "azurerm_public_ip" "example" {
  name                = "Bastionpublicip"
  resource_group_name = "Yuv_rg1"
}