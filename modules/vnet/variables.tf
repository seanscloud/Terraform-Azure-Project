variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnet_names" {
  type = list(string)
}

variable "subnet_prefixes" {
  type = list(string)
}
