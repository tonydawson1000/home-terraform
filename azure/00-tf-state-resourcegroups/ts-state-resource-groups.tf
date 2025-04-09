locals {
  env_poc  = "poc"
  env_dev  = "dev"
  env_oat  = "oat"
  env_prod = "prod"
}

resource "azurerm_resource_group" "poc" {
  name     = "${var.prefix}-${var.resource_group_name}-${local.env_poc}"
  location = var.resource_group_location
  tags = {
    "env"  = local.env_poc
    "team" = var.tag_team
  }
}

resource "azurerm_resource_group" "dev" {
  name     = "${var.prefix}-${var.resource_group_name}-${local.env_dev}"
  location = var.resource_group_location
  tags = {
    "env"  = local.env_dev
    "team" = var.tag_team
  }
}

resource "azurerm_resource_group" "oat" {
  name     = "${var.prefix}-${var.resource_group_name}-${local.env_oat}"
  location = var.resource_group_location
  tags = {
    "env"  = local.env_oat
    "team" = var.tag_team
  }
}

resource "azurerm_resource_group" "prod" {
  name     = "${var.prefix}-${var.resource_group_name}-${local.env_prod}"
  location = var.resource_group_location
  tags = {
    "env"  = local.env_prod
    "team" = var.tag_team
  }
}