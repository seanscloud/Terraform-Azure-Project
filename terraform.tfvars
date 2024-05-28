resource_group = "Terraform Deployment Project"
location       = "South Central US"
vnets = {
  vnet1 = {
    name               = "myVNet1"
    address_space      = ["10.0.0.0/16"]
    resource_group_key = "rg1"
    subnets = [
      {
        name           = "subnet1"
        address_prefix = "10.0.1.0/24"
      },
      {
        name           = "subnet2"
        address_prefix = "10.0.2.0/24"
      }
    ]
  }
  vnet2 = {
    name               = "myVNet2"
    address_space      = ["10.1.0.0/16"]
    resource_group_key = "rg2"
    subnets = [
      {
        name           = "subnet1"
        address_prefix = "10.1.1.0/24"
      },
      {
        name           = "subnet2"
        address_prefix = "10.1.2.0/24"
      }
    ]
  }
}
vms = {
  vm1 = {
    name               = "myVM1"
    resource_group_key = "rg1"
    size               = "Standard_B1s"
    subnet_key         = "vnet1"
  }
  vm2 = {
    name               = "myVM2"
    resource_group_key = "rg2"
    size               = "Standard_B1s"
    subnet_key         = "vnet2"
  }
}
admin_username = "azureuser"
admin_password = "P@ssw0rd1234!"
