resource "azuread_group" "bronze_quotes_admin_group" {
  display_name     = "${azurerm_storage_account.adls.name}-bronze-quotes-admin"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azuread_group_member" "bronze_quotes_admin_group_member" {
  group_object_id  = azuread_group.bronze_quotes_admin_group.object_id
  member_object_id = data.azuread_user.admin.object_id
}

resource "azuread_group_member" "bronze_quotes_admim_group_member_deployer" {
  group_object_id  = azuread_group.bronze_quotes_admin_group.object_id
  member_object_id = data.azurerm_client_config.current.object_id
}

resource "azuread_group" "bronze_quotes_writer_group" {
  display_name     = "${azurerm_storage_account.adls.name}-bronze-quotes-writer"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}

resource "azuread_group" "bronze_quotes_reader_group" {
  display_name     = "${azurerm_storage_account.adls.name}-bronze-quotes-reader"
  security_enabled = true

  owners = [
    data.azurerm_client_config.current.object_id,
    data.azuread_user.admin.object_id
  ]
}