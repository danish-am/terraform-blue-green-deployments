resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.traffic_manager_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = "Priority"

  dns_config {
    relative_name = var.traffic_manager_dns_name
    ttl           = 30
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/api/HttpTrigger?"   # Adjust your function path if needed
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
}
resource "azurerm_traffic_manager_external_endpoint" "blue" {
  name           = "blue-endpoint"
  profile_id     = azurerm_traffic_manager_profile.this.id
  target         = var.blue_app_url
  priority       = 1
}

resource "azurerm_traffic_manager_external_endpoint" "green" {
  name           = "green-endpoint"
  profile_id     = azurerm_traffic_manager_profile.this.id
  target         = var.green_app_url
  priority       = 2
}
