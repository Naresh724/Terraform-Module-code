
# ### NSG creation

# resource "azurerm_network_security_group" "nsg-staging" {
#     name = var.nsg_name
#     resource_group_name =  var.rg_name
#     location = var.rg_location
# }


# ### NSG and Subnet Linking

# resource "azurerm_subnet_network_security_group_association" "subnsg-staging" {
#     subnet_id = azurerm_subnet.subnet1.id
#     network_security_group_id = azurerm_network_security_group.nsg.id
# }
