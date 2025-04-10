terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }

  backend "azurerm" {

  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  # TODO: SECURITY/PERMISSIONS storage_use_azuread             = true
}