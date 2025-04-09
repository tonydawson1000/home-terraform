variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group to contain All Resources for this Terraform Project"
}

variable "resource_group_location" {
  type        = string
  description = "Name of the Resource Group Location"
}

variable "prefix" {
  type        = string
  description = "Prefix to use for Resources in this Project"
}

variable "tag_team" {
  type        = string
  description = "Name used for the Azure Tag - Team"
}