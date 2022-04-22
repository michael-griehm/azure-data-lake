resource "azurerm_storage_data_lake_gen2_filesystem" "crypto_deltatable_filesystem" {
  name               = "delta-table"
  storage_account_id = azurerm_storage_account.adls.id

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_writer_group.object_id
    permissions = "-w-"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "crypto_deltatable_unmanaged_quotes" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_deltatable_filesystem.name
  resource           = "directory"
  path               = "unmanaged/quotes"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_writer_group.object_id
    permissions = "-w-"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "crypto_deltatable_managed_quotes" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_deltatable_filesystem.name
  resource           = "directory"
  path               = "managed/quotes"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.deltatable_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.deltatable_quotes_writer_group.object_id
    permissions = "-w-"
  }
}