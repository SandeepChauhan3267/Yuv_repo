resource "azurerm_storage_account" "sa123" {
  name                     = "yuvstorageaccount"
  resource_group_name      = "Yuv_rg1"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "con123" {
  depends_on            = [azurerm_storage_account.sa123]
  name                  = "yuvcontainer"
  storage_account_name  = "yuvstorageaccount"
  container_access_type = "private"
}