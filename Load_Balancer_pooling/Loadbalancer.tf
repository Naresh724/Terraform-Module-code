# resource "azurerm_lb" "lb01" {
#     name = "LB01"
#     resource_group_name = local.name
#     location = local.location
#     sku = "Standard"
#     frontend_ip_configuration {
#       name = "forntend-ip-lb"
#       public_ip_address_id = azurerm_public_ip.pip-lb.id
#     }
# }

# resource "azurerm_lb_backend_address_pool" "backend-pool" {
#     name = "backend_pool"
#     loadbalancer_id = azurerm_lb.lb01.id
# }

# resource "azurerm_network_interface_backend_address_pool_association" "ass" {
#     network_interface_id = azurerm_network_interface.nic1.id
#     backend_address_pool_id = azurerm_lb_backend_address_pool.backend-pool.id
#     ip_configuration_name = "ipconfig1"
# }

# resource "azurerm_network_interface_backend_address_pool_association" "ass2" {
#     network_interface_id = azurerm_network_interface.nic2.id
#     backend_address_pool_id = azurerm_lb_backend_address_pool.backend-pool.id
#     ip_configuration_name = "ipconfig2"
# }

# resource "azurerm_network_interface_backend_address_pool_association" "ass3" {
#     network_interface_id = azurerm_network_interface.nic3.id
#     backend_address_pool_id = azurerm_lb_backend_address_pool.backend-pool.id
#     ip_configuration_name = "ipconfig3"
# }

# resource "azurerm_lb_rule" "rule" {
#     name = "rule1"
#     frontend_ip_configuration_name = azurerm_lb.lb01.frontend_ip_configuration[0].name
#     loadbalancer_id = azurerm_lb.lb01.id
#     backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend-pool.id]
#     frontend_port = 80
#     backend_port = 80
#     protocol = "Tcp"
# }

# resource "azurerm_lb_nat_rule" "nat_rule" {

#     name = "nat_rule1"
#     resource_group_name = local.name
#     loadbalancer_id = azurerm_lb.lb01.id
#     backend_address_pool_id = azurerm_lb_backend_address_pool.backend-pool.id
#     frontend_ip_configuration_name = azurerm_lb.lb01.frontend_ip_configuration[0].name
#     frontend_port_start = 22
#     frontend_port_end = 5000
#     backend_port = 22
#     protocol = "Tcp"

# }