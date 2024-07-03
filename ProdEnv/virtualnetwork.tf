

### Virtual_Network_Creation

resource "azurerm_virtual_network" "vn" {
    name = var.vn_name
    resource_group_name = var.rg_name
    location = var.rg_location
    address_space = var.vn_address_space
}
