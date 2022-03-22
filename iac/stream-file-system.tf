resource "azurerm_storage_data_lake_gen2_filesystem" "crypto_quotes_filesystem" {
  name               = "crypto-quotes"
  storage_account_id = azurerm_storage_account.adls.id
}

resource "azurerm_storage_data_lake_gen2_path" "stream_path" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_quotes_filesystem.name
  resource           = "directory"
  path               = "ehns-quote-streams"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.streams_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.streams_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.streams_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.streams_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.streams_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.streams_writer_group.object_id
    permissions = "-w-"
  }
}