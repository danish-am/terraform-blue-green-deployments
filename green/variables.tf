variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region for deployment."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "function_app_name" {
  description = "The Azure Function App name."
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

variable "storage_account_rg" {
  description = "The resource group where the storage account is located."
  type        = string
}

variable "additional_app_settings" {
  description = "Any additional app settings like WEBSITE_CONTENTSHARE that are set by Azure automatically."
  type        = map(string)
  default     = {}
}