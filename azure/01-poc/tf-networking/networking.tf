resource "azurerm_virtual_network" "hub" {
  name                = var.vnet_hub_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  address_space       = var.vnet_hub_address_space
}

resource "azurerm_virtual_network" "poc" {
  name                = var.vnet_poc_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  address_space       = var.vnet_poc_address_space

  subnet {
    name             = var.subnet_poc_web_name
    address_prefixes = var.subnet_poc_web_prefixes
  }

  subnet {
    name             = var.subnet_poc_app_name
    address_prefixes = var.subnet_poc_app_prefixes
  }

  subnet {
    name             = var.subnet_poc_db_name
    address_prefixes = var.subnet_poc_db_prefixes
  }

  tags = {
    env  = var.tag_env
    team = var.tag_team
  }
}