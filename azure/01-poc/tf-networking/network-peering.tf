resource "azurerm_virtual_network_peering" "poc_to_hub" {
  name                      = "${azurerm_virtual_network.poc.name}-to-${azurerm_virtual_network.hub.name}"
  resource_group_name       = data.azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.poc.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "hub_to_poc" {
  name                      = "${azurerm_virtual_network.hub.name}-to-${azurerm_virtual_network.poc.name}"
  resource_group_name       = data.azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.poc.id
}