resource "azurerm_public_ip" "pip2" {
    name = "vm02"
    resource_group_name = local.rg_name
    location = local.rg_location
    allocation_method = "Static"
    sku = "Standard"
    zones = [ "2" ]
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_network_interface" "nic2" {
    name = "nic2"
    resource_group_name = local.rg_name
    location = local.rg_location
    ip_configuration {
      name = "ip2"
      private_ip_address_allocation = "Dynamic"
      subnet_id = azurerm_subnet.subnet1.id
      public_ip_address_id = azurerm_public_ip.pip2.id
    }
}

resource "azurerm_linux_virtual_machine" "vm2" {
    name = "vm02"
    resource_group_name = local.rg_name
    location = local.rg_location
    size = "Standard_B1ls"
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    zone = "2"
    disable_password_authentication = "false"
    network_interface_ids = [
        azurerm_network_interface.nic2.id
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