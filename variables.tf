variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "South Central US"
}

variable "vnets" {
  description = "A map of Virtual Network definitions"
  type = map(object({
    name          = string
    address_space = list(string)
    subnets = list(object({
      name           = string
      address_prefix = string
    }))
  }))
}

variable "vms" {
  description = "A map of Virtual Machine definitions"
  type = map(object({
    name       = string
    size       = string
    subnet_key = string
  }))
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
}