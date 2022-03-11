data "azuread_user" "admin" {
  user_principal_name = var.admin_user_principal_name
}

resource "azuread_group" "stream_admin_group" {
  display_name     = "${azurerm_storage_account.adls.name}-stream-admin"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azuread_group_member" "admin_group_member" {
  group_object_id  = azuread_group.stream_admin_group.object_id
  member_object_id = data.azuread_user.admin.object_id
}

resource "azuread_group" "stream_writer_group" {
  display_name     = "${azurerm_storage_account.adls.name}-stream-writer"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azuread_group" "stream_reader_group" {
  display_name     = "${azurerm_storage_account.adls.name}-stream-reader"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azurerm_storage_account" "adls" {
  name                     = "cryptoanalyticslake"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "crypto_quotes_filesystem" {
  name               = "crypto-quotes"
  storage_account_id = azurerm_storage_account.adls.id
}

resource "azurerm_storage_data_lake_gen2_path" "stream_path" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_quotes_filesystem.name
  resource           = "directory"
  path               = "stream"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.stream_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.stream_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.stream_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.stream_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.stream_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.stream_writer_group.object_id
    permissions = "-w-"
  }
}
