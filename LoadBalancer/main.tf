resource "azurerm_lb" "Yuv" {
  name                = var.lb
  location            = data.azurerm_resource_group.Yuv.location
  resource_group_name = data.azurerm_resource_group.Yuv.name

  frontend_ip_configuration {
    name                 = "Lb_publicip"
    public_ip_address_id = data.azurerm_public_ip.Yuv.id
  }
}