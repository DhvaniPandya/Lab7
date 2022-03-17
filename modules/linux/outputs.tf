output "public_ip_address" {
  value = azurerm_linux_virtual_machine.linux_machine.*.public_ip_address
}

output "private_ip_address" {
  value = azurerm_linux_virtual_machine.linux_machine.*.private_ip_address
}

output "hostname" {
  value = azurerm_linux_virtual_machine.linux_machine.*.name
}
output "avset_Name" {
  value = azurerm_availability_set.availability_set.name
}

