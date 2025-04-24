variable "resource_group_name" {
  description = "The Resource Group where the Traffic Manager Profile is created."
  type        = string
}

variable "traffic_manager_name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "traffic_manager_dns_name" {
  description = "The DNS name prefix (relative name) for the Traffic Manager."
  type        = string
}

variable "blue_app_url" {
  description = "The URL for the Blue deployment Function App."
  type        = string
}

variable "green_app_url" {
  description = "The URL for the Green deployment Function App."
  type        = string
}
