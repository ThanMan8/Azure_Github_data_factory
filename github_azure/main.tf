terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.41.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.36.0"
    }
  }
}
# Terraform backend configuration block-precreated
terraform {
  backend "azurerm" {
    resource_group_name  = "databricks-rg-plurasight_test-fl3stl3nxtvrm"
    storage_account_name = "azureterraformbackendth"
    container_name       = "backendazure"
    key                  = "ccpterraform.tfstate"
  }
}
# RG create
resource "azurerm_resource_group" "Azure_github_actions" {
  name     = var.resource_group_name
  location = "West Europe"
}

# Create Storage storage_account

resource "azurerm_storage_account" "exampleth" {
  name                     = "azuregithubth"
  resource_group_name      = azurerm_resource_group.Azure_github_actions.name
  location                 = azurerm_resource_group.Azure_github_actions.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
