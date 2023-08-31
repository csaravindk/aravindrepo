terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.70.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.41.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.19.0"
    }
  }
}
provider "azurerm" {
  
}

provider "azuread" {
  
}


provider "databricks" {
  host                        = azurerm_databricks_workspace.myworkspace.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.myworkspace.id
  azure_tenant_id             = data.azurerm_client_config.current.tenant_id
  azure_client_id             = data.azurerm_client_config.current.client_id
  azure_client_secret         = "GjD8Q~5em5BWJ2ioKqqsgW3gj3zjHuZHNSqNibSW"
  #auth_type  = "azure-client-secret"

}

/*
resource "azurerm_role_assignment" "aravind" {
  scope                = azurerm_resource_group.applicationrg.id
  role_definition_name = "owner"
  principal_id         = "739e964a-7af4-4c96-bdef-a676da8f868a"
}
*/
