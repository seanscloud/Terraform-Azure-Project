output "vnet_id" {
  value = [for vnet in azurerm_virtual_network.tapVN : vnet.id]
}

output "vm_id" {
  value = [for vm in azurerm_virtual_machine.tapVM : vm.id]
}
