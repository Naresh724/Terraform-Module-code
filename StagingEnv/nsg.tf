
### NSG creation

resource "azurerm_network_security_group" "nsg" {
    name = "${local.env}-${local.Business_unit}-${var.nsg_name}"
    resource_group_name =  azurerm_resource_group.rg.name
    location = var.rg_location
    
}


### NSG and Subnet Linking

resource "azurerm_subnet_network_security_group_association" "subnsg" {
    subnet_id = azurerm_subnet.subnet1.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}
