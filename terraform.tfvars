resource_group = "Terraform_Deployment_Project"
location       = "South Central US"
vnets = {
  vnet1 = {
    name               = "tapVNet1"
    address_space      = ["10.0.0.0/16"]
    resource_group_key = "tapRG"
    subnets = [
      {
        name           = "tapsub1.1"
        address_prefix = "10.0.1.0/24"
      },
      {
        name           = "tapsub1.2"
        address_prefix = "10.0.2.0/24"
      }
    ]
  }
  vnet2 = {
    name               = "tapVNet2"
    address_space      = ["10.1.0.0/16"]
    resource_group_key = "tapRG"
    subnets = [
      {
        name           = "tapsub2.1"
        address_prefix = "10.1.1.0/24"
      },
      {
        name           = "tapsub2.2"
        address_prefix = "10.1.2.0/24"
      }
    ]
  }
}
vms = {
  vm1 = {
    name               = "AZ-TAP-VM1"
    resource_group_key = "tapRG"
    size               = "Standard_B1s"
    subnet_key         = "vnet1"
  }
  vm2 = {
    name               = "AZ-TAP-VM2"
    resource_group_key = "tapRG"
    size               = "Standard_B1s"
    subnet_key         = "vnet2"
  }
}
admin_username = "TAPAdmin"
admin_password = "P@ssw0rd1234!"
