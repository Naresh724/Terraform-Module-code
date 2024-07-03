resource "azurerm_resource_group" "rg" {
    name = local.rg_name
    location = local.rg_location

}

resource "azurerm_virtual_network" "vn" {
    name = var.vn_name
    resource_group_name = local.rg_name
    location = local.rg_location
    address_space = var.vn_address_space
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "subnet1" {
    name = var.subnet_name
    resource_group_name = local.rg_name
    virtual_network_name = var.vn_name
    address_prefixes = var.vn_subnet_address_space
    depends_on = [ azurerm_virtual_network.vn ]
}


resource "azurerm_public_ip" "pip" {
    name = var.pip_name
    resource_group_name = local.rg_name
    location = local.rg_location
    allocation_method = var.allocation_method
    sku = "Standard"
    zones = [ "1" ]
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    resource_group_name = local.rg_name
    location = local.rg_location
    ip_configuration {
        name = var.ip_config_name
        subnet_id = azurerm_subnet.subnet1.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.pip.id
    }   
}

resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vm_name
    resource_group_name = local.rg_name
    location = local.rg_location
    size = "Standard_B1ls"
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    disable_password_authentication = "false"
    zone = "1"
    network_interface_ids = [ 
        azurerm_network_interface.nic.id
     ]
     os_disk {
       caching = "ReadWrite"
       storage_account_type = "Standard_LRS"
     }
     source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}
