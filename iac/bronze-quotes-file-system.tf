resource "azurerm_storage_data_lake_gen2_filesystem" "crypto_bronze_filesystem" {
  name               = "crypto-bronze"
  storage_account_id = azurerm_storage_account.adls.id
}

resource "azurerm_storage_data_lake_gen2_path" "crypto_bronze_quotes_by_day_spark_partition_path" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_bronze_filesystem.name
  resource           = "directory"
  path               = "quotes-by-day-spark-partition"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.bronze_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.bronze_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.bronze_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.bronze_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.bronze_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.bronze_quotes_writer_group.object_id
    permissions = "-w-"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "crypto_bronze_quotes_by_day_manual_partition_path" {
  storage_account_id = azurerm_storage_account.adls.id
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.crypto_bronze_filesystem.name
  resource           = "directory"
  path               = "quotes-by-day-manual-partition"

  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.bronze_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.bronze_quotes_admin_group.object_id
    permissions = "rwx"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.bronze_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.bronze_quotes_reader_group.object_id
    permissions = "r--"
  }
  ace {
    scope       = "default"
    type        = "group"
    id          = azuread_group.bronze_quotes_writer_group.object_id
    permissions = "-w-"
  }
  ace {
    scope       = "access"
    type        = "group"
    id          = azuread_group.bronze_quotes_writer_group.object_id
    permissions = "-w-"
  }
}