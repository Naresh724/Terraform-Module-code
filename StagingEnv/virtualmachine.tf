

### Virtual Machine Creation

resource "azurerm_linux_virtual_machine" "vm" {
    name = "${local.env}-${local.Business_unit}-${var.vm_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location =var.rg_location
    size =var.vm_size
    tags = local.common_tags
    network_interface_ids = [
      azurerm_network_interface.nic.id
    ]
    admin_username =var.vm_admin_username
    admin_password =var.vm_admin_password
    disable_password_authentication = var.vm_disable_password_authentication
    os_disk {
        caching = var.vm_caching
        storage_account_type = var.vm_storage_account_type
    }
      source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  
}


### VM2 Creation

resource "azurerm_windows_virtual_machine" "vm2" {
    name = "${local.env}-${var.vm2_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location =var.rg_location
    size =var.vm_size
    tags= local.common_tags
    network_interface_ids = [
        azurerm_network_interface.nic2.id
    ]
    admin_username =var.vm_admin_username
    admin_password =var.vm_admin_password
    os_disk {
        caching = var.vm_caching
        storage_account_type = var.vm_storage_account_type
    }
    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

