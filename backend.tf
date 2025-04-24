terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"                
    storage_account_name = "terraformbackend1730"                
    container_name       = "tfstate"                            
    key                  = "blue-green-deployment.terraform.tfstate"  
  }
}
