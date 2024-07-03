### RG creation 
resource "azurerm_resource_group" "rg-staging" {
    name = var.rg_name
    location = var.rg_location
    tags = var.tags
}
