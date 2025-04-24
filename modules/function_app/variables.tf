variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan."
  type        = string
}

variable "function_app_name" {
  description = "The name of the Azure Function App."
  type        = string
}

variable "storage_account_name" {
  description = "The Azure Storage Account name."
  type        = string
}

variable "storage_account_access_key" {
  description = "Access key for the Azure Storage Account."
  type        = string
}

variable "package_url" {
  description = "The URL of the Function App deployment package (ZIP)."
  type        = string
}

variable "additional_app_settings" {
  description = "Any additional app settings like AzureWebJobsStorage."
  type        = map(string)
  default     = {}
}
