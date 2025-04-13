output "management_group" {
  description = "Azure Management Group object."
  value       = azurerm_management_group.this
}

output "management_group_subscription_associations" {
  description = "Management Group Subscription Association objects."
  value       = azurerm_management_group_subscription_association.this
}

output "management_group_consumption_budgets" {
  description = "Consumption Budget Management Group objects."
  value       = azurerm_consumption_budget_management_group.this
}