data "azurerm_management_group" "example" {
  display_name = "Tenant Root Group"
}

module "example" {
    source = "../.."
    
    name   = "example"
    display_name = "Example Management Group"

    parent_group_id = data.azurerm_management_group.example.id
}