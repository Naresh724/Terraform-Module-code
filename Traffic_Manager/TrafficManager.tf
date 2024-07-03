# resource "azurerm_traffic_manager_profile" "tm01" {
#     name = "trafficmanager1724"
#     resource_group_name = local.name
#     traffic_routing_method = "Performance"

#     dns_config {
#       relative_name = "lb01"
#       ttl = 5
#     }
#     monitor_config {
#       protocol = "HTTP"
#       port = 80
#       path = "/"
#     }
#     }

# resource "azurerm_traffic_manager_endpoint" "endpoint1" {
#     name = "endpoint1"
    
# }
