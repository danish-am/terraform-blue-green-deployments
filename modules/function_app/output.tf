output "function_app_id" {
  description = "The ID of the Azure Function App."
  value       = azurerm_linux_function_app.this.id
}

output "function_app_name" {
  description = "The name of the Azure Function App."
  value       = azurerm_linux_function_app.this.name
}

output "default_hostname" {
  description = "The default hostname of the Azure Function App."
  value       = azurerm_linux_function_app.this.default_hostname
}
