output "traffic_manager_profile_fqdn" {
  description = "The FQDN of the Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.this.fqdn
}
