

resource "azurerm_linux_virtual_machine" "vm02" {
    name = "VM02"
    resource_group_name = local.name
    location = local.location
    size = "Standard_B1ls"
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    disable_password_authentication = "false"
    custom_data = filebase64("nginx.sh")
    zone = "2"
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