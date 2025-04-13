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
  parent_management_group_id = var.parent_group_id != "" ? length(split("/", var.parent_group_id)) == 1 ? format("/providers/Microsoft.Management/managementGroups/%s", var.parent_group_id) : var.parent_group_id : null

  // Assignment of subscriptions to the management group is done via different resource
  // azurerm_management_group_subscription_association
  subscription_ids = []

  lifecycle {
    ignore_changes = [
      // Ignore changes to the subscription_ids attribute
      subscription_ids,
    ]
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_management_group"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_management_group"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_management_group"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_management_group"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}