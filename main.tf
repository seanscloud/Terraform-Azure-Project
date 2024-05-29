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

resource "azurerm_resource_group" "tapRG" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "tapVN" {
  for_each            = var.vnets
  name                = each.value.name
  address_space       = each.value.address_space
  location            = azurerm_resource_group.tapRG.location
  resource_group_name = azurerm_resource_group.tapRG.name
}

resource "azurerm_subnet" "tapSUB" {
  for_each = { for vnet_key, vnet_value in var.vnets : vnet_key => vnet_value.subnets }
  count    = length(each.value)

  name                 = each.value[count.index].name
  address_prefixes     = [each.value[count.index].address_prefix]
  resource_group_name  = azurerm_resource_group.tapRG.name
  virtual_network_name = azurerm_virtual_network.tapVN[each.key].name
}

resource "azurerm_network_interface" "tapNIC" {
  for_each            = var.vms
  name                = "${each.value.name}-nic"
  location            = azurerm_resource_group.tapRG.location
  resource_group_name = azurerm_resource_group.tapRG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tapSUB[each.value.subnet_key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "tapVM" {
  for_each              = var.vms
  name                  = each.value.name
  location              = azurerm_resource_group.tapRG.location
  resource_group_name   = azurerm_resource_group.tapRG.name
  network_interface_ids = [azurerm_network_interface.tapNIC[each.key].id]
  vm_size               = each.value.size

  storage_os_disk {
    name              = "${each.value.name}_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = each.value.name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}