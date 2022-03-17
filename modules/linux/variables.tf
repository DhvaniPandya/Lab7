variable "rg_linux" {}

variable "linux-name" {
}
variable "location" {}
variable "resource_group" {}
variable "subnet1_id" {}
variable "nb_count" {}
variable "linux_avset" {}

variable "size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "dnp1194"
}

variable "public_key" {
  default = "/home/dnp1194/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "/home/dnp1194/.ssh/id_rsa"
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
  default = "OpenLogic"
}

variable "offer" {
  default = "CentOS"
}

variable "sku" {
  default = "7.5"
}

variable "OS_version" {
  default = "latest"
}

variable "availability_set" {
  default = "linux_avs"
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "dnp1194@gmail.com"
    Environment  = "Lab"
  }
}

