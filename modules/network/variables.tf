variable "rg_network" {}

variable "resource_group" {}

variable "location" {}

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "network-subnet1"
}

variable "subnet2" {
  default = "network-subnet2"
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]

}

variable "subnet_space2" {
  default = ["10.0.2.0/24"]
}

variable "nsg" {
  default = "network-nsg01"
}

variable "nsg2" {
  default = "network-nsg02"
}

