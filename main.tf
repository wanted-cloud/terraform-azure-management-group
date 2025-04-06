/**
 * # wanted-cloud/terraform-azure-management-group
 *
 * Building block module to create and manage Azure Management Group.
 *
 * ## Usage
 *
 * > TBA
 */
resource "azurerm_management_group" "this" {
  name                       = var.name
  display_name               = var.display_name != "" ? var.display_name : var.name
  parent_management_group_id = var.parent_group_id != "" ? format("/providers/Microsoft.Management/managementGroups/%s", var.parent_group_id) : null

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}