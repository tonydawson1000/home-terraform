variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group to contain All Resources for this Terraform Project"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account to hold the Storage Container - for Terraform State"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the Storage Container to hold Terraform State for this Project"
}

variable "tag_env" {
  type        = string
  description = "Name used for the Azure Tag - Environment"
}

variable "tag_team" {
  type        = string
  description = "Name used for the Azure Tag - Team"
}
