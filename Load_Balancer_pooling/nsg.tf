
resource "azurerm_network_security_group" "nsg" {
    name = var.nsg_name
    resource_group_name = local.name
    location = local.location
    depends_on = [ azurerm_resource_group.rg ]
    security_rule {
    name                        = "allow_all"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
    }
  
}

resource "azurerm_subnet_network_security_group_association" "subnsg" {
    subnet_id = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}