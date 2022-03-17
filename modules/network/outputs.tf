
output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet1_id" {
  description = "Id of the created subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet2_id" {
  description = "Id of the created subnet"
  value       = azurerm_subnet.subnet1.id
}

output "subnet1_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet2_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet_address_space" {
  value = azurerm_subnet.subnet.address_prefixes
}

output "subnet2_address_space" {
  value = azurerm_subnet.subnet1.address_prefixes
}

