resource "azurerm_resource_group" "rg123" {
for_each = var.Yuvrgs

name = each.value.name
location = each.value.location
}

