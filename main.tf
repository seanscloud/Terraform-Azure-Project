terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}
#resource "azurerm_resource_group" "tapRG" {
#  name     = "Terraform Deployment Project"
#  location = "South Central"
#}

module "vnet" {
  source            = "./modules/vnet"
  resource_group    = var.resource_group
  location          = var.location
  vnet_name         = var.vnet_name
  address_space     = var.vnet_address_space
  subnet_names      = var.subnet_names
  subnet_prefixes   = var.subnet_prefixes
}

module "vm" {
  source            = "./modules/vm"
  resource_group    = var.resource_group
  location          = var.location
  vm_name           = var.vm_name
  vm_size           = var.vm_size
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  subnet_id         = module.vnet.subnet_ids[0]
}