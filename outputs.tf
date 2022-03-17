output "rg_linux" {
  value = module.resource_group.rg_linux
}

output "rg_windows" {
  value = module.resource_group.rg_windows
}

output "rg_network" {
  value = module.resource_group.rg_network
}

output "vnet_name" {
  value = module.network.virtual_network_name
}

output "vnet_space" {
  value = module.network.address_space
}

output "subnet1_id" {
  value = module.network.subnet1_id
}

output "subnet2_id" {
  value = module.network.subnet2_id
}

output "subnet1_name" {
  value = module.network.subnet1_name
}

output "subnet2_name" {
  value = module.network.subnet2_name
}

output "subnet1_space" {
  value = module.network.subnet_address_space
}

output "subnet2_space" {
  value = module.network.subnet2_address_space
}

output "linux_avs_name" {
  value = module.linux.avset_Name
}

output "linux_vm_hostnames" {
  value = module.linux.hostname
}

output "linux_private_ips" {
  value = module.linux.private_ip_address
}

output "linux_public_ips" {
  value = module.linux.public_ip_address
}

output "windows_avs_name" {
  value = module.windows.w_avset_Name
}

output "windows_vm_hostnames" {
  value = module.windows.w_hostname
}

output "windows_private_ips" {
  value = module.windows.w_private_ip_address
}

output "windows_public_ips" {
  value = module.windows.w_public_ip_address
}

