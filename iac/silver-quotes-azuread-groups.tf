resource "azuread_group" "silver_quotes_admin_group" {
  display_name     = "${azurerm_storage_account.adls.name}-silver-quotes-admin"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azuread_group_member" "silver_quotes_admin_group_member" {
  group_object_id  = azuread_group.silver_quotes_admin_group.object_id
  member_object_id = data.azuread_user.admin.object_id
}

resource "azuread_group" "silver_quotes_writer_group" {
  display_name     = "${azurerm_storage_account.adls.name}-silver-quotes-writer"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azuread_group" "silver_quotes_reader_group" {
  display_name     = "${azurerm_storage_account.adls.name}-silver-quotes-reader"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}