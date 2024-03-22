resource "azurerm_public_ip" "publicip123" {
  for_each = var.Yuvpublicips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku = each.value.sku
}

