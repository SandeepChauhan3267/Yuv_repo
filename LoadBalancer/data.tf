data "azurerm_resource_group" "Yuv" {
  name = "Yuv_rg1"
}

data "azurerm_public_ip" "Yuv" {
  name                = "Lb_publicip"
  resource_group_name = data.azurerm_resource_group.Yuv.name
}