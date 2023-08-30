/*
resource "azurerm_resource_group" "Resource_group" {
  name     = var.resource_group_name
  location = var.location
}

*/
data "azuread_application" "SCIM" {
  display_name = "Azure Databricks SCIM Provisioning Connector"
  
}

output "application_object_id" {
  value = data.azuread_application.SCIM.id
}

data "azuread_service_principal" "tf" {
  display_name = "Terraform Enterprise"
}

output "SPN_object_id" {
  value = data.azuread_service_principal.tf.id
}

resource "azuread_service_principal" "mytf" {
  application_id = data.azuread_service_principal.tf.application_id
  app_role_assignment_required = true
}

resource "azuread_group" "Uc-test" {
  display_name     = "Uc-test"
  security_enabled = true
}
   
    
    #Assign a user and group to an internal application
    resource "azuread_app_role_assignment" "SCIM" {
      app_role_id         = azuread_service_principal.mytf.app_role_ids["Admin.All"]
      principal_object_id = azuread_group.Uc-test.object_id
      resource_object_id  = data.azuread_service_principal.tf.object_id
    }




