terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01517213RG"
    storage_account_name = "tfstaten01517213sa"
    container_name       = "tfstatefiles"
    key                  = "lab.terraform.tfstate"
  }
}
