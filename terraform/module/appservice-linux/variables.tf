
# variable "default" {
#   description = "Default Value for general infraestructure"
#   type = object({
#     resource_group_name = string
#     location = string
#     tags = map(string) 
#   })
#   default = {
#     resource_group_name = null
#     location = null
#     tags = {}
#   }
# }

variable "rg_resource" {
  description = "Resource Groups Name"
  default = ""
  type = string
}

variable "location_resource" {
  description = "Location Resource"
  default = ""
  type = string
}

variable "tags_resource" {
  description = "Tags Resource"
  default = null
  type = map(string)
}

variable "appservice_name" {
  description = "App Service Name"
  default = ""
  type = string
}

variable "appservice_asp_plan_id" {
  description = "App Service Plan ID"
  default = ""
  type = string
}

variable "appservice_https" {
  description = "Https Only"
  default = true
  type = bool
}

variable "appserviece_appsettings" {
  description = "Configuration for App Service Linux"
  type = object({
    APPINSIGHTS_INSTRUMENTATIONKEY = string
    APPLICATIONINSIGHTS_CONNECTION_STRING = string
    ApplicationInsightsAgent_EXTENSION_VERSION = string
  })

  default = {
    APPINSIGHTS_INSTRUMENTATIONKEY = null
    APPLICATIONINSIGHTS_CONNECTION_STRING = null
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
  }
}

# variable "appsetting_appinsights_key" {
#   description = "App Setting - App Insights Instrumentation Key"
#   default = null
#   type = string
# }

# variable "appsetting_applitioninsights_cs" {
#   description = "App Setting - Application Insights Connection String"
#   default = null
#   type = string
# }

# variable "appsetting_appinsights_agents_version" {
#   description = "App Setting - Application Insights Agent Extesion Version"
#   default = "~3"
#   type = string
# }