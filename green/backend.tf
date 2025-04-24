terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"                
    storage_account_name = "terraformbackend1730"                
    container_name       = "tfstate"                            
    key                  = "green-deployment.terraform.tfstate"  
  }
}
