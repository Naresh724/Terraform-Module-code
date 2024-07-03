resource "azurerm_resource_group" "rg" {
    name = local.name
    location = local.location
  
}

resource "azurerm_resource_group" "rg2" {
    name = "RG02"
    location = "eastus2"
}

resource "azurerm_resource_group" "rg3" {
 name = "RG03"
 location = "centralindia"
}