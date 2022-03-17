resource "azurerm_availability_set" "availability_set" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg_windows
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg_windows
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_windows
  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet2_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
  }

  tags = local.common_tags

}

resource "azurerm_windows_virtual_machine" "windows_machine" {
  for_each            = var.windows_name
  name                = each.key
  resource_group_name = var.rg_windows
  location            = var.location
  size                = var.size
  computer_name       = each.key
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.availability_set.id

  winrm_listener {
    protocol = "Http"
  }

  os_disk {
    name                 = "${each.key}-osdisk"
    storage_account_type = var.windows_os_disk_attr["storage_account_type"]
    disk_size_gb         = var.windows_os_disk_attr["disk_size"]
    caching              = var.windows_os_disk_attr["disk_caching"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
  tags = local.common_tags

}

