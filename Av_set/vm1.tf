resource "azurerm_virtual_network" "vn" {
    name = "vn02"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    address_space = [ "13.0.0.0/16" ]
}

resource "azurerm_subnet" "subnet1" {
    name = "subnet01"
    resource_group_name = data.azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vn.name
    address_prefixes = [ "13.0.1.0/24" ] 
}



resource "azurerm_public_ip" "pip1" {
    name = "pip1"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
   
}

resource "azurerm_network_interface" "nic1" {
    name = "nic1"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    ip_configuration {
      name = "ip1"
      private_ip_address_allocation = "Dynamic"
      subnet_id = azurerm_subnet.subnet1.id
      public_ip_address_id = azurerm_public_ip.pip1.id
    }
}

resource "azurerm_linux_virtual_machine" "vm1" {
    name = "vmset"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    size = "Standard_B1ls"
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    availability_set_id = azurerm_availability_set.avset1.id
    disable_password_authentication = "false"
    network_interface_ids = [
        azurerm_network_interface.nic1.id
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