resource "azurerm_storage_account" "storage"{
    name = "nareshvarmast01" 
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_replication_type = "LRS"
    account_tier = "Standard"

    
}