resource "azurerm_key_vault" "keyvault123" {
  name                        = var.kv
  location                    = data.azurerm_resource_group.Yuv.location
  resource_group_name         = data.azurerm_resource_group.Yuv.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.Yuv.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.Yuv.tenant_id
    object_id = data.azurerm_client_config.Yuv.object_id

    key_permissions     = ["Get"]
    secret_permissions  = [    "Get", "List" , "Set", "Delete", "Recover", "Backup", "Restore"   ]
    storage_permissions = ["Get"]
  }
}