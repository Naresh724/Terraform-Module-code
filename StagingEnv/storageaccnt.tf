

### Storage account creation

resource "azurerm_storage_account" "example" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.rg_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  

  tags = local.common_tags
}
