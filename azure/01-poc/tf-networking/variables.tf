variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group to contain All Resources for this Terraform Project"
}

variable "tag_env" {
  type        = string
  description = "Name used for the Azure Tag - Environment"
}

variable "tag_team" {
  type        = string
  description = "Name used for the Azure Tag - Team"
}

variable "vnet_hub_name" {
  type        = string
  description = "Name for the 'Hub' VNet"
}
variable "vnet_hub_address_space" {
  description = "List of address spaces to use for the 'Hub' VNet"
  type        = list(string)
}

variable "vnet_poc_name" {
  type        = string
  description = "Name for the 'PoC' VNet"
}
variable "vnet_poc_address_space" {
  description = "List of address spaces to use for the 'PoC' VNet"
  type        = list(string)
}

variable "subnet_poc_web_name" {
  type        = string
  description = "Name for the 'PoC' Web Subnet"
}
variable "subnet_poc_web_prefixes" {
  description = "List of Address Prefixes to use for the 'PoC' Web Subnet"
  type        = list(string)
}

variable "subnet_poc_app_name" {
  type        = string
  description = "Name for the 'PoC' App Subnet"
}
variable "subnet_poc_app_prefixes" {
  description = "List of Address Prefixes to use for the 'PoC' App Subnet"
  type        = list(string)
}

variable "subnet_poc_db_name" {
  type        = string
  description = "Name for the 'PoC' DB Subnet"
}
variable "subnet_poc_db_prefixes" {
  description = "List of Address Prefixes to use for the 'PoC' DB Subnet"
  type        = list(string)
}