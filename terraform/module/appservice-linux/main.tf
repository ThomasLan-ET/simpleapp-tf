
resource "azurerm_linux_web_app" "appservice" {
  name                = var.appservice_name
  resource_group_name = var.rg_resource
  location            = var.location_resource
  service_plan_id     = var.appservice_asp_plan_id
  https_only          = var.appservice_https
  site_config {
    ftps_state    = "FtpsOnly"
    http2_enabled = true
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = var.appserviece_appsettings.APPINSIGHTS_INSTRUMENTATIONKEY
    APPLICATIONINSIGHTS_CONNECTION_STRING      = var.appserviece_appsettings.APPLICATIONINSIGHTS_CONNECTION_STRING
    ApplicationInsightsAgent_EXTENSION_VERSION = var.appserviece_appsettings.ApplicationInsightsAgent_EXTENSION_VERSION
  }
}