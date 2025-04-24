# ✅ Create App Service Plan (Green)
resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name              
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"                                    
}

# ✅ Existing Storage Account
data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = var.storage_account_rg
}

# ✅ Deploy Function App using module (GREEN)
module "function_app_green" {
  source                      = "../modules/function_app"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  service_plan_id             = azurerm_service_plan.this.id           
  function_app_name           = var.function_app_name
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_access_key
  package_url                 = var.package_url

  additional_app_settings = {
    AzureWebJobsStorage = data.azurerm_storage_account.this.primary_connection_string
  }
}
