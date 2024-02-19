variable "tags_resource" {
  description = "Tags Resource"
  default = null
  type = map(string)
}

variable "sqldb_name" {
  description = "Name SQL Data Base"
  default = ""
  type = string
}

variable "sqldb_serverid" {
  description = "SQL Server ID"
  default = ""
  type = string
}

variable "sqldb_read" {
  description = "SQL Data Base Read Sacale-Out"
  default = false
  type = bool
}

variable "sqldb_sku" {
  description = "SKU for SQL Data Base"
  default = "Basic"
  type = string
}

variable "sqldb_zoneredundant" {
  description = "SQL Data Base Zone Redundant"
  default = false
  type = bool
}

variable "sqldb_poolid" {
  description = "SQL Data Base Pool ID"
  default = null
  type = string
}

variable "sqldb_sizegb" {
  description = "SQL Data Base Max Size GB"
  default = 2
  type = number
}