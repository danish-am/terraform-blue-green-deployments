output "function_app_id" {
  description = "The ID of the Function App deployed in the green environment."
  value       = module.function_app_green.function_app_id
}

output "function_app_name" {
  description = "The name of the Function App deployed in the green environment."
  value       = module.function_app_green.function_app_name
}

output "function_app_default_hostname" {
  description = "The default hostname of the Function App deployed in the green environment."
  value       = module.function_app_green.default_hostname
}
output "function_app_url" {
  description = "The URL of the deployed Function App."
  value       = "https://${module.function_app_green.default_hostname}/api/HttpTrigger?"
}
