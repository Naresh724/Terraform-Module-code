

### Public ip creation

resource "azurerm_public_ip" "pip" {
    name = var.pip_name
    resource_group_name = var.rg_name
    location = var.rg_location
    allocation_method = var.pip_allocation_method
}

### Public ip creation

resource "azurerm_public_ip" "pip2" {
    name = var.pip2_name
    resource_group_name = var.rg_name
    location = var.rg_location
    allocation_method = var.pip_allocation_method
}
