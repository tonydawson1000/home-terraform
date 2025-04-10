resource "azurerm_storage_container" "main" {
  name                  = var.storage_container_name
  storage_account_id    = data.azurerm_storage_account.main.id
  container_access_type = "blob"
  # TODO: SECURITY/PERMISSIONS container_access_type = "private"
}