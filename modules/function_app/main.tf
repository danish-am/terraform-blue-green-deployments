resource "azurerm_linux_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan_id                      # ✅ Using the passed ID (NO resource creation here)
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  site_config {
    application_stack {
      python_version = "3.10"
    }
  }

  app_settings = merge(
    {
      FUNCTIONS_WORKER_RUNTIME    = "python"
      FUNCTIONS_EXTENSION_VERSION = "~4"
      WEBSITE_RUN_FROM_PACKAGE    = var.package_url
    },
    var.additional_app_settings
  )
}
