
resource "azurerm_network_interface" "nic1" {
    name = var.nic1_name
    resource_group_name = local.name
    location = local.location
    ip_configuration {
      name = "ipconfig1"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip-vm1.id

    }
}

resource "azurerm_network_interface" "nic2" {
    name = var.nic2_name
    resource_group_name = local.name
    location = local.location
    ip_configuration {
      name = "ipconfig2"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip-vm2.id

    }
}

resource "azurerm_network_interface" "nic3" {
    name = var.nic3_name
    resource_group_name = local.name
    location = local.location
    ip_configuration {
      name = "ipconfig3"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip-vm3.id
    }
}