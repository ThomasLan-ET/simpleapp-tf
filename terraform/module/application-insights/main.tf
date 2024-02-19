
resource "azurerm_application_insights" "appinsight" {
  name                = var.app_insight_name
  resource_group_name = var.rg_resource
  location            = var.location_resource
  application_type    = var.application_type
  tags = var.tags_resource
}