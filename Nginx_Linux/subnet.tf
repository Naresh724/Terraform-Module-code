resource "azurerm_subnet" "subnet" {
    name = "${local.env}-${local.unit}-${var.subnet_name}"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vn.name
    address_prefixes = var.subnet_address_prefixes
}

