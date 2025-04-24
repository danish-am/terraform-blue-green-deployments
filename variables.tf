variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}
variable "traffic_manager_name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "traffic_manager_dns_name" {
  description = "The DNS prefix for the Traffic Manager profile."
  type        = string
}

variable "blue_app_url" {
  description = "The URL of the Blue Function App."
  type        = string
}

variable "green_app_url" {
  description = "The URL of the Green Function App."
  type        = string
}