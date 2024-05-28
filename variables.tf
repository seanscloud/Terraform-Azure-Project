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
  description = "Map of virtual networks with subnets"
  type = map(object({
    name                = string
    address_space       = list(string)
    resource_group_key  = string
    subnets             = list(object({
      name           = string
      address_prefix = string
    }))
  }))
}

variable "vms" {
  description = "Map of virtual machines"
  type = map(object({
    name                = string
    resource_group_key  = string
    size                = string
    subnet_key          = optional(string)
  }))
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
}
