resource "azurerm_management_group_subscription_association" "this" {
  for_each = {
    for subscription in var.subscriptions : subscription => subscription
  }

  management_group_id = azurerm_management_group.this.id
  subscription_id     = length(split("/", each.value)) == 1 ? format("/subscriptions/%s", each.value) : each.value

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