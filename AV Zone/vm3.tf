resource "azurerm_public_ip" "pip3" {
    name = "vm03"
    resource_group_name = local.rg_name
    location = local.rg_location
    allocation_method = "Static"
    sku = "Standard"
    zones = [ "3" ]
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_network_interface" "nic3" {
    name = "nic3"
    resource_group_name = local.rg_name
    location = local.rg_location
    ip_configuration {
      name = "ip3"
      private_ip_address_allocation = "Dynamic"
      subnet_id = azurerm_subnet.subnet1.id
      public_ip_address_id = azurerm_public_ip.pip3.id
    }
}

resource "azurerm_linux_virtual_machine" "vm3" {
    name = "vm03"
    resource_group_name = local.rg_name
    location = local.rg_location
    size = "Standard_B1ls"
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    zone = "3"
    disable_password_authentication = "false"
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