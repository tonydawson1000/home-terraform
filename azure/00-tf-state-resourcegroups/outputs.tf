output "resource_group_name_poc" {
  value = azurerm_resource_group.poc.name
}
output "resource_group_location_poc" {
  value = azurerm_resource_group.poc.location
}

output "resource_group_name_dev" {
  value = azurerm_resource_group.dev.name
}
output "resource_group_location_dev" {
  value = azurerm_resource_group.dev.location
}

output "resource_group_name_oat" {
  value = azurerm_resource_group.oat.name
}
output "resource_group_location_oat" {
  value = azurerm_resource_group.oat.location
}

output "resource_group_name_prod" {
  value = azurerm_resource_group.prod.name
}
output "resource_group_location_prod" {
  value = azurerm_resource_group.prod.location
}