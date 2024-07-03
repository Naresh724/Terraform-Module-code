data "azurerm_resource_group" "rg" {
    name = "rg01"
}

resource "azurerm_availability_set" "avset1" {
    name = "avset1"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    platform_fault_domain_count = "3"
    platform_update_domain_count = "20"
}

