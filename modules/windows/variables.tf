variable "rg_windows" {}
variable "resource_group" {}
variable "location" {}
variable "subnet2_id" {}
variable "availability_set" {
  default = "linux_avs"
}

variable "nb_count" {
  default = "2"
}

variable "windows_name" {
  type = map(string)
  default = {
    ansible-w-vm1 = "Standard_B1s"
  }
}

variable "windows_avs" {
  default = "windows_avs"
}


variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2019-Datacenter"
}

variable "windows_version" {
  default = "latest"
}

variable "windows_os_disk_attr" {
  type = map(string)
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = "127"
    disk_caching         = "ReadWrite"
  }
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "dnp1194@gmail.com"
    Environment  = "Lab"
  }
}

variable "linux-name" {
  default     = "lab03s2-db1-u-vm1"
  type        = string
  description = "This resource group is to host all test infra"
}

variable "size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "dnp1194"
}

variable "admin_password" {
  default = "P@$$w0rd1234!"
}

variable "public_key" {
  default = "/home/dnp1194/.ssh/id_rsa.pub"
}

variable "storage_accountType" {
  default = "Premium_LRS"
}

variable "disk_size" {
  default = "32"
}

variable "caching" {
  default = "ReadWrite"
}

variable "publisher" {
  default = "Canonical"
}

variable "offer" {
  default = "UbuntuServer"
}

variable "sku" {
  default = "19.04"
}

variable "OS_version" {
  default = "latest"
}

