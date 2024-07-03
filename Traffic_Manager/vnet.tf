resource "azurerm_virtual_network" "vnet" {
    name = var.vnet1_name
    resource_group_name = local.name
    location = local.location
    address_space = var.address_space
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_virtual_network" "vnet2" {
    name = "VN02"
    resource_group_name = azurerm_resource_group.rg2.name
    location = azurerm_resource_group.rg2.location
    address_space = ["16.0.0.0/16"]
    depends_on = [ azurerm_resource_group.rg2 ]
}

resource "azurerm_virtual_network" "vnet3" {
    name = "VN03"
    resource_group_name = azurerm_resource_group.rg3.name
    location = azurerm_resource_group.rg3.location
    address_space = ["17.0.0.0/16"]
    depends_on = [ azurerm_resource_group.rg3 ]
}