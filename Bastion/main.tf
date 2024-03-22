resource "azurerm_bastion_host" "main" {
  name                = "Bastion"
  location            = "Central India"
  resource_group_name = "Yuv_rg1"

  ip_configuration {
    name                 = "Bastionconfiguration"
    subnet_id            = data.azurerm_subnet.example.id
    public_ip_address_id = data.azurerm_public_ip.example.id
  }
}