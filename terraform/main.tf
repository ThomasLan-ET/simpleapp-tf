terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.88.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "et-practice-rbe"
    storage_account_name = "etrbetf"
    container_name       = "rbe-terraform"
    key                  = "tf.sandbox.terraform.state"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

data "azurerm_resource_group" "rg" {
  name = "et-dev-sandbox"
}

data "azurerm_service_plan" "asp" {
  name = "sxasptfdev"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_mssql_server" "sqlserver" {
  name = "sxsqlstfdev"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_mssql_elasticpool" "sqlpool" {
  name = "sxpooldbtfdev"
  server_name = data.azurerm_mssql_server.sqlserver.name
  resource_group_name = data.azurerm_resource_group.rg.name
}

module "appinsights" {
  source = "./module/application-insights"
  app_insight_name = "sxappstfdev"
  rg_resource = data.azurerm_resource_group.rg.name
  location_resource = data.azurerm_resource_group.rg.location

  tags_resource = {
    Owner = "Thomas"
    Env = "SandBox"
  }
}

module "appservice-linux"{
  source = "./module/appservice-linux"
  appservice_name = "sxappstfdev"
  rg_resource = data.azurerm_resource_group.rg.name
  location_resource = data.azurerm_resource_group.rg.location
  appservice_asp_plan_id = data.azurerm_service_plan.asp.id

  appserviece_appsettings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = module.appinsights.appinsight_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = module.appinsights.appinsight_connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
  }

  tags_resource = {
    Owner = "Thomas"
    Env = "SandBox"
  }
} 

module "sqldb" {
  source = "./module/sql-db"
  sqldb_name = "sxdbtfdev"
  sqldb_serverid = data.azurerm_mssql_server.sqlserver.id
  sqldb_poolid = data.azurerm_mssql_elasticpool.sqlpool.id
  sqldb_sku = "ElasticPool" #Default Basic
  sqldb_sizegb = 1
}