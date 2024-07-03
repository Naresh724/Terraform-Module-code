

### Public ip creation

resource "azurerm_public_ip" "pip" {
    name = "${local.env}-${local.Business_unit}-${var.pip_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.rg_location
    allocation_method = var.pip_allocation_method
    tags = local.common_tags
  
    
}

### Public ip creation

resource "azurerm_public_ip" "pip2" {
    name = var.pip2_name
    resource_group_name = azurerm_resource_group.rg.name
    location = var.rg_location
    allocation_method = var.pip_allocation_method
    tags = local.common_tags
    
    
}
