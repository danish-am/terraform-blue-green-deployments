module "traffic_manager" {
  source                   = "./modules/trafficmanager"
  resource_group_name      = var.resource_group_name
  traffic_manager_name     = var.traffic_manager_name
  traffic_manager_dns_name = var.traffic_manager_dns_name
  blue_app_url             = var.blue_app_url
  green_app_url            = var.green_app_url
}
