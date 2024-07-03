resource "azurerm_public_ip" "pip-lb" {
    name = var.pip-lb-name
    resource_group_name = local.name
    location = local.location
    allocation_method = var.pip_allocation_method
    depends_on = [ azurerm_resource_group.rg ]
    sku = "Standard"
    
}

resource "azurerm_public_ip" "pip-apg" {
    name = "apg-pip"
    resource_group_name = local.name
    location = local.location
    allocation_method = var.pip_allocation_method
    depends_on = [ azurerm_resource_group.rg ]
    sku = "Standard"
    zones = [ "1" ]
}

resource "azurerm_public_ip" "pip-vm1" {
    name = var.pip-vm1-name
    resource_group_name = local.name
    location = local.location
    allocation_method = var.pip_allocation_method
    zones = ["1"]
    depends_on = [ azurerm_resource_group.rg ]
    sku = "Standard"
    
}

resource "azurerm_public_ip" "pip-vm2" {
    name = var.pip-vm2-name
    resource_group_name = local.name
    location = local.location
    allocation_method = var.pip_allocation_method
    zones = ["2"]
    depends_on = [ azurerm_resource_group.rg ]
    sku = "Standard"
}

resource "azurerm_public_ip" "pip-vm3" {
    name = var.pip-vm3-name
    resource_group_name = local.name
    location = local.location
    allocation_method = var.pip_allocation_method
    zones = ["3"]
    depends_on = [ azurerm_resource_group.rg ]
    sku = "Standard"
}








