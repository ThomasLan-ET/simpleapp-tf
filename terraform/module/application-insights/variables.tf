
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

variable "app_insight_name" {
  description = "Name Application Insight"
  default = ""
  type = string
}

variable "application_type" {
  description = "Type of Application Insights"
  default = "web"
  type = string
}