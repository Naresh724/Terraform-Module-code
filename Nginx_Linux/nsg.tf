resource "azurerm_network_security_group" "nsg" {
    name = "${local.env}-${local.unit}-${var.nsg_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.rg_location
    security_rule {
  name                        = "allow_22"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
    }
     security_rule {
        name                        = "Allow_80"
        priority                    = 1000
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_port_range           = "*"
        destination_port_range      = "80"
        source_address_prefix       = "*"
        destination_address_prefix  = "*"
    }

}

resource "azurerm_subnet_network_security_group_association" "subnetnsg" {
    subnet_id = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}
