
resource "azurerm_public_ip" "pip3" {
    name = "pip3"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
    zones = [ "3" ]
}

resource "azurerm_network_interface" "nic3" {
    name = "nic3"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    ip_configuration {
      name = "ipconfig3"
      subnet_id = azurerm_subnet.subnet1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip3.id
    }
}

resource "azurerm_linux_virtual_machine" "vm3" {
    name = "vm03"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    admin_username = "Naresh"
    admin_password = "Burrynaresh724#"
    size = "Standard_B1ls"
    zone = "3"
    disable_password_authentication = "false"
    custom_data = base64encode(file("nginx.sh"))
    network_interface_ids = [ 
        azurerm_network_interface.nic3.id
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