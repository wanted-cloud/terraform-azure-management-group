/**
 * Created by WANTED.solutions s.r.o.
 */
terraform {
  required_version = ">= 1.9"

  required_providers {
    // ADD required providers references
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.113.0"
    }
  }
}