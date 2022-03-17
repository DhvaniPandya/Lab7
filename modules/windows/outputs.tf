output "w_public_ip_address" {
  value = values(azurerm_windows_virtual_machine.windows_machine)[*].public_ip_address
}

output "w_private_ip_address" {
  value = values(azurerm_windows_virtual_machine.windows_machine)[*].private_ip_address
}

output "w_hostname" {
  value = values(azurerm_windows_virtual_machine.windows_machine)[*].name
}

output "w_avset_Name" {
  value = azurerm_availability_set.availability_set.name
}

