locals {
    name = "RG01"
    location = "eastus"
}

locals {
  backend_address_pool_name      = "${azurerm_virtual_network.vnet.name}-backend"
  frontend_port_name             = "${azurerm_virtual_network.vnet.name}-frontend_name"
  frontend_ip_configuration_name = "${azurerm_virtual_network.vnet.name}-front_ip_conf_name"
  http_setting_name              = "${azurerm_virtual_network.vnet.name}-setting_name"
  listener_name                  = "${azurerm_virtual_network.vnet.name}-http_listener"
  request_routing_rule_name      = "${azurerm_virtual_network.vnet.name}-req_routing_rule"
  redirect_configuration_name    = "${azurerm_virtual_network.vnet.name}-redirect_conf_name"
}