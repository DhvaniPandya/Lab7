resource "azurerm_availability_set" "availability_set" {
  name                         = var.availability_set
  location                     = var.location
  resource_group_name          = var.rg_linux
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux-name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg_linux
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux-name}${format("%1d", count.index + 1)}"

  tags = local.common_tags
}


resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux-name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_linux
  ip_configuration {
    name                          = "${var.linux-name}-ipconfig-${format("%1d", count.index + 1)}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet1_id
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)
  }

  tags = local.common_tags

}

resource "azurerm_linux_virtual_machine" "linux_machine" {
  count                 = var.nb_count
  name                  = "${var.linux-name}-${format("%1d", count.index + 1)}"
  resource_group_name   = var.rg_linux
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  network_interface_ids = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  availability_set_id   = azurerm_availability_set.availability_set.id

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.linux-name}-${format("%1d", count.index + 1)}"
    caching              = var.caching
    storage_account_type = var.storage_accountType
    disk_size_gb         = var.disk_size
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.OS_version
  }
  tags = local.common_tags

}


