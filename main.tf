
module "resource_group" {
  source     = "./modules/resource_group"
  rg_network = "Network-RG"
  rg_windows = "Windows-RG"
  rg_linux   = "Linux-RG"
  location   = "canadacentral"
}

module "network" {
  source         = "./modules/network"
  rg_network     = "Network-RG"
  resource_group = "module.resource_group.rg_network.name"
  location       = "canadacentral"
  vnet           = "vnet1"
  vnet_space     = ["10.0.0.0/16"]
  subnet         = "subnet"
  subnet_space   = ["10.0.0.0/24"]
  subnet2        = "subnet2"
  subnet_space2  = ["10.0.2.0/24"]
  nsg            = "nsg1"
  nsg2           = "nsg2"
}

module "linux" {
  source         = "./modules/linux"
  rg_linux       = "Linux-RG"
  linux-name     = "ansible-c-vm"
  linux_avset    = "linux-avs"
  nb_count       = 2
  location       = "canadacentral"
  resource_group = "module.resource_group.rg_linux.name"
  subnet1_id     = module.network.subnet1_id
  depends_on     = [module.network]
}

module "windows" {
  source      = "./modules/windows"
  rg_windows  = "Windows-RG"
  windows_avs = "windows-avs"
  windows_name = {
    ansible-w-vm1 = "Standard_Bls"
  }
  location       = "canadacentral"
  resource_group = "module.resource_group.rg_windows.name"
  subnet2_id     = module.network.subnet2_id
  depends_on     = [module.network]
}

