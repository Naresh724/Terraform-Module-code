resource "azurerm_virtual_network" "vn" {
    name = "${local.env}-${local.unit}-${var.vn_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.rg_location
    address_space = var.vn_address_space
    depends_on = [ azurerm_resource_group.rg ]
}