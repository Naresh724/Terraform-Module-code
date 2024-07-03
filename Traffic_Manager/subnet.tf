resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = local.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.subnet_address_prefixes
    depends_on = [ azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet2" {
    name = "subnet2"
    resource_group_name = azurerm_resource_group.rg2.name
    virtual_network_name = azurerm_virtual_network.vnet2.name
    address_prefixes = ["16.0.1.0/24"]
    depends_on = [ azurerm_resource_group.rg2 ]

}

resource "azurerm_subnet" "subnet3" {
    name = "subnet3"
    resource_group_name = azurerm_resource_group.rg3.name
    virtual_network_name = azurerm_virtual_network.vnet3.name
    address_prefixes = ["17.0.1.0/24"]
    depends_on = [ azurerm_resource_group.rg3 ]

}