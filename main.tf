module "rg" { 
  source  = "terrakube-reg-dev.applaudostudios.dev/poc/rg/azurerm" 
  version = "1.0.0" 
  
  name = var.workspace_name
  region = var.workspace_region
}

module "appservice" { 
  source  = "terrakube-reg-dev.applaudostudios.dev/poc/appservice/azurerm" 
  version = "1.0.0" 

  rg_name = module.rg.rg_name
  rg_location = module.rg.rg_location
  appservice_name = var.workspace_name
  appservice_os = var.workspace_os
  appservice_tier = var.workspace_tier
  appservice_size = var.workspace_size
  appservice_capacity = var.workspace_capacity
}