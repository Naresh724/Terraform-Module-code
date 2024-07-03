resource "azurerm_virtual_network" "vnet" {
    name = var.vnet1_name
    resource_group_name = local.name
    location = local.location
    address_space = var.address_space
    depends_on = [ azurerm_resource_group.rg ]
}