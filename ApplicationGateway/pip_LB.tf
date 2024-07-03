resource "azurerm_public_ip" "pip_LB" {
    name = "pip_lb"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_public_ip" "pip2" {
    name = "pip2"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
    zones = [ "2" ]
}

resource "azurerm_public_ip" "pip3" {
    name = "pip3"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
    zones = [ "3" ]
}
