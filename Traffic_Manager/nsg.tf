
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

resource "azurerm_network_security_group" "nsg2" {
    name = "NSG2"
    resource_group_name = azurerm_resource_group.rg2.name
    location = azurerm_resource_group.rg2.location
    depends_on = [ azurerm_resource_group.rg2 ]
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

resource "azurerm_subnet_network_security_group_association" "subnsg2" {
    subnet_id = azurerm_subnet.subnet2.id
    network_security_group_id = azurerm_network_security_group.nsg2.id
}



resource "azurerm_network_security_group" "nsg3" {
    name = "NSG3"
    resource_group_name = azurerm_resource_group.rg3.name
    location = azurerm_resource_group.rg3.location
    depends_on = [ azurerm_resource_group.rg3 ]
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

resource "azurerm_subnet_network_security_group_association" "subnsg3" {
    subnet_id = azurerm_subnet.subnet3.id
    network_security_group_id = azurerm_network_security_group.nsg3.id
}