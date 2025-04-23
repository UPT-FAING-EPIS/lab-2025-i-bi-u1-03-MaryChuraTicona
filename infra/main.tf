provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-bi"
  location = "East US"
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = "sqlserverbi2025"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = SuperPass1234!
}

resource "azurerm_sql_database" "sqldb" {
  name                = "basedatosbi"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Basic"
}

variable "admin_password" {}
