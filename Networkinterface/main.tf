resource "azurerm_network_interface" "NIC123" {
  for_each = var.Yuvnics

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = each.value.ip_configuration.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.ip_configuration.public_ip
  }
} 