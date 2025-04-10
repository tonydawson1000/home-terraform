output "vnet_hub_name" {
  value = azurerm_virtual_network.hub.name
}
output "vnet_hub_address_space" {
  value = azurerm_virtual_network.hub.address_space
}

output "vnet_poc_name" {
  value = azurerm_virtual_network.poc.name
}
output "vnet_poc_address_space" {
  value = azurerm_virtual_network.poc.address_space
}
output "vnet_poc_subnets_names" {
  value = azurerm_virtual_network.poc.subnet[*].name
}
output "vnet_poc_subnets_address_prefixes" {
  value = azurerm_virtual_network.poc.subnet[*].address_prefixes
}