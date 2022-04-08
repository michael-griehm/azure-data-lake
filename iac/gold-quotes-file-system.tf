resource "azurerm_storage_data_lake_gen2_filesystem" "crypto_gold_filesystem" {
  name               = "crypto-gold"
  storage_account_id = azurerm_storage_account.adls.id
}

resource "azurerm_storage_data_lake_gen2_path" "crypto_gold_quotes_by_day_path" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_gold_filesystem.name
  resource           = "directory"
  path               = "quotes-by-day"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.gold_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.gold_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.gold_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.gold_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.gold_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.gold_quotes_writer_group.object_id
    permissions = "-w-"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "crypto_gold_quotes_by_day_path_single_csv" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_gold_filesystem.name
  resource           = "directory"
  path               = "quotes-by-day-single-csv"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.gold_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.gold_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.gold_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.gold_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.gold_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.gold_quotes_writer_group.object_id
    permissions = "-w-"
  }
}