# Create a Storage Account
resource "azurerm_storage_account" "main" {
  name                = "${lower(var.prefix)}statestorage"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  account_tier               = "Standard"
  account_kind               = "StorageV2"
  account_replication_type   = "GRS"
  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"
  # TODO: SECURITY/PERMISSIONS shared_access_key_enabled         = false
  # TODO: SECURITY/PERMISSIONS default_to_oauth_authentication   = true
  infrastructure_encryption_enabled = false

  blob_properties {
    versioning_enabled            = true
    change_feed_enabled           = true
    change_feed_retention_in_days = 90
    last_access_time_enabled      = true

    delete_retention_policy {
      days = 30
    }

    container_delete_retention_policy {
      days = 30
    }
  }

  sas_policy {
    expiration_period = "00.02:00:00"
    expiration_action = "Log"
  }

  timeouts {
    create = "5m"
    read   = "5m"
  }

  tags = {
    Environment = var.tag_env
    Team        = var.tag_team
  }
}