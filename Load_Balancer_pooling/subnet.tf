resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = local.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.subnet_address_prefixes

}

resource "azurerm_subnet" "subnet1" {
    name = "app_subnet"
    resource_group_name = local.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["12.0.2.0/24"]

}