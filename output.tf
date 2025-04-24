output "blue_app_url" {
  value = var.blue_app_url
}

output "green_app_url" {
  value = var.green_app_url
}

output "traffic_manager_profile_fqdn" {
  description = "The FQDN of the Traffic Manager profile."
  value       = module.traffic_manager.traffic_manager_profile_fqdn
}
