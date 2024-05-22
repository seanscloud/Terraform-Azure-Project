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
  name     = "Terraform Deployment Project"
  location = "South Central"
}

