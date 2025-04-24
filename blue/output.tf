output "function_app_id" {
  description = "The ID of the Function App deployed in the blue environment."
  value       = module.function_app_blue.function_app_id
}

output "function_app_name" {
  description = "The name of the Function App deployed in the blue environment."
  value       = module.function_app_blue.function_app_name
}

output "function_app_default_hostname" {
  description = "The default hostname of the Function App deployed in the blue environment."
  value       = module.function_app_blue.default_hostname
}
output "function_app_url" {
  description = "The complete Function App URL for HTTP trigger."
  value       = "https://${module.function_app_blue.default_hostname}/api/HttpTrigger?"
}
