resource "azurerm_mssql_server" "Yuv" {
  name                         = var.dbs
  resource_group_name          = "Yuv_rg1"
  location                     = "Central India"
  version                      = "12.0"
  administrator_login          = "Yuvaanss"
  administrator_login_password = "Yuvss@3267"
    minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "Yuv" {
  name           = var.db
  server_id      = azurerm_mssql_server.Yuv.id
  sku_name       = "S0"
}