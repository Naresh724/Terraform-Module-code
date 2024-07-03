resource "azurerm_network_interface" "nic" {
    name = "${local.env}-${local.unit}-${var.nic_name}"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    ip_configuration {
      name = "${local.env}-${local.unit}-${var.ip_config_name}"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip.id
    }

}