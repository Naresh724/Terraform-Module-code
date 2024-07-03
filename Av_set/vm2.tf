





resource "azurerm_public_ip" "pip5" {
    name = "pip5"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"

   
}

resource "azurerm_network_interface" "nic5" {
    name = "nic5"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    ip_configuration {
      name = "ip2"
      private_ip_address_allocation = "Dynamic"
      subnet_id = azurerm_subnet.subnet1.id
      public_ip_address_id = azurerm_public_ip.pip5.id
    }
}

resource "azurerm_linux_virtual_machine" "vm2" {
    name = "vmset2"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    size = "Standard_B1ls"
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    availability_set_id = azurerm_availability_set.avset1.id
    disable_password_authentication = "false"
    network_interface_ids = [
        azurerm_network_interface.nic5.id
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