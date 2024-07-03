### RG creation 
resource "azurerm_resource_group" "rg" {
    name = "${local.env}-${local.Business_unit}-${var.rg_name}"
    location = var.rg_location
    tags = local.common_tags
}
