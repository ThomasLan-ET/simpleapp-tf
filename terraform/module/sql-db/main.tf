resource "azurerm_mssql_database" "sqldb" {
  name           = var.sqldb_name
  server_id      = var.sqldb_serverid
  max_size_gb    = var.sqldb_sizegb
  read_scale     = var.sqldb_read
  sku_name       = var.sqldb_sku
  zone_redundant = var.sqldb_zoneredundant
  elastic_pool_id = var.sqldb_poolid

  tags = var.tags_resource
}