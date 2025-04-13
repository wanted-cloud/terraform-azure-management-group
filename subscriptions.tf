resource "azurerm_management_group_subscription_association" "this" {
  for_each = {
    for subscription_id in var.subscription_ids : subscription_id => subscription_id
  }

  management_group_id = azurerm_management_group.this.id
  subscription_id     = each.value

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }

}