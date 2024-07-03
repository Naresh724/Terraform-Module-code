resource "azurerm_resource_group" "rg" {
    name = "rg01"
    location = "eastus"
}

resource "azurerm_virtual_network" "vn1" {
    name = "vn01"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = ["14.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
    name = "subnet01"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vn1.name
    address_prefixes = ["14.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
    name = "subnet02"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vn1.name
    address_prefixes = ["14.0.2.0/24"]
}
resource "azurerm_network_security_group" "nsg1" {
    name = "nsg01"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location

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

resource "azurerm_subnet_network_security_group_association" "subnsg1" {
    subnet_id = azurerm_subnet.subnet1.id
    network_security_group_id = azurerm_network_security_group.nsg1.id 
}

resource "azurerm_public_ip" "pip1" {
    name = "pip1"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
    zones = [ "1" ]
}

resource "azurerm_network_interface" "nic" {
    name = "nic1"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    ip_configuration {
      name = "ipconfig1"
      subnet_id = azurerm_subnet.subnet1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip1.id
    }
}

resource "azurerm_linux_virtual_machine" "vm1" {
    name = "vm01"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    admin_username = "Naresh"
    admin_password = "Burrynaresh724#"
    size = "Standard_B1ls"
    zone = "1"
    disable_password_authentication = "false"
    custom_data = base64encode(file("nginx.sh"))
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