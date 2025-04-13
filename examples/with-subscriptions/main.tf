data "azurerm_subscription" "current" {}

module "example" {
    source = "../.."
    
    name   = "example"
    display_name = "Example Management Group"

    subscriptions = [
        data.azurerm_subscription.current.subscription_id,
    ]
}