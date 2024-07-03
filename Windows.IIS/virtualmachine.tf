

resource "azurerm_windows_virtual_machine" "vm" {
    name = "${local.env}-${local.unit}-${var.vm_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    size = "Standard_B1ls"
    network_interface_ids = [
        azurerm_network_interface.nic.id
    ]
    admin_username = "naresh"
    admin_password = "Burrynaresh724#"
    custom_data = base64encode(file("nginx.sh"))
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

