resource "azurerm_network_security_group" "NSG123" {
  name                = "YuvNetwork-security-group"
  location            = "Central India"
  resource_group_name = "Yuv_rg1"
}