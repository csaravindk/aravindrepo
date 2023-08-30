variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
  default     = "applicationrg"
}
variable "location" {
  type        = string
  description = "Name of the location"
  default     = "West Europe"
}
variable "virtualnetwork" {
  type = map(any)
  default = {
    name          = "applicationvnet"
    address_space = "10.0.0.0/16"
  }
}
variable "nsg_name" {
  type        = string
  description = "name of the network security group"
  default     = "Applicationnsg"
}
variable "storageaccount_name" {
  type        = string
  description = "name of the storage account"
  default     = "unitycatalognewadlsg2"
}
variable "conatiner_name" {
  type        = string
  description = "name of the container"
  default     = "catalog001"
}
variable "databricks_workspace_name" {
  type        = string
  description = "name of the workspace"
  default     = "aravindworkspace"

}
variable "access_connector" {
  type        = string
  description = "acess connector for databricks"
  default     = "mydbconnector"
}
variable "workspace_id" {
  type    = number
  default = "4451092577056154"
}