




### Netowrk Interface Creation

resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    resource_group_name = var.rg_name
    location = var.rg_location
    ip_configuration {
      name = var.ip_config_name
      subnet_id = azurerm_subnet.subnet1.id
      private_ip_address_allocation =var.ip_config_private_ip_allocation
      public_ip_address_id = azurerm_public_ip.pip.id
      
    }
}

### Netowrk Interface2 Creation

resource "azurerm_network_interface" "nic2" {
    name = var.nic2_name
    resource_group_name = var.rg_name
    location = var.rg_location
    ip_configuration {
      name = var.ip_config_name2
      subnet_id = azurerm_subnet.subnet1.id
      private_ip_address_allocation =var.ip_config_private_ip_allocation
      public_ip_address_id = azurerm_public_ip.pip2.id
      
    }
}
