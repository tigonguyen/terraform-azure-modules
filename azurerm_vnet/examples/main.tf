terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = ">=2.19.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

# Configure the Hashicorp Vault provider
provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to use $VAULT_ADDR and $VAULT_TOKEN
}

data "vault_generic_secret" "service_principle" {
  path = "azure/service_test"
}

provider "azurerm" {
  features {}
  subscription_id = data.vault_generic_secret.service_principle.data["subscription"]
  client_id       = data.vault_generic_secret.service_principle.data["appId"]
  client_secret   = data.vault_generic_secret.service_principle.data["password"]
  tenant_id       = data.vault_generic_secret.service_principle.data["tenant"]
}

module "azurerm_vnet" {
  source              = "../azurerm_vnet"

  name                = "example_vnet"
  resource_group_name = "test_rg"
  subnet_list                = {
    AzureFirewallSubnet      = "10.0.0.0/26"
    GatewaySubnet            = "10.0.0.224/27"
  }
}

module "azurerm_vnet_1" {
  source              = "../azurerm_vnet"

  name                = "example_vnet_1"
  address_space       = [ "192.168.0.0/24" ]
  resource_group_name = module.azurerm_vnet.vnet["resource_group_name"]
}