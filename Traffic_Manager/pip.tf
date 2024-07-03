
resource "azurerm_public_ip" "pip-nic1" {
    name = var.pip-vm1-name
    resource_group_name = local.name
    allocation_method = var.pip_allocation_method
    location = local.location
    depends_on = [ azurerm_resource_group.rg ]
    sku = "Standard"
}

resource "azurerm_public_ip" "pip-nic2" {
    name = var.pip-vm2-name
    resource_group_name =azurerm_resource_group.rg2.name
    location = azurerm_resource_group.rg2.location
    allocation_method = "Static"
    depends_on = [ azurerm_resource_group.rg2]
    sku = "Standard"

}

resource "azurerm_public_ip" "pip-nic3" {
    name = var.pip-vm3-name
    resource_group_name =azurerm_resource_group.rg3.name
    location = azurerm_resource_group.rg3.location
    allocation_method = "Static"
    depends_on = [ azurerm_resource_group.rg3 ]
    sku = "Standard"

}
