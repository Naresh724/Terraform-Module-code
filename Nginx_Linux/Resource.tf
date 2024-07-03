resource "azurerm_resource_group" "rg" {
    name = "${local.env}-${local.unit}-${var.rg_name}"
    location = var.rg_location
}