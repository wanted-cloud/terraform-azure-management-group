module "example" {
    source = "../.."
    
    name   = "example"
    display_name = "Example Management Group"

    budgets = [{
      name = "budget1"
      amount = 100
      time_grain = "Monthly"
      start_date = "2021-01-01T15:04:05Z"
      notifications = [{
            name = "notification1"
            operator = "GreaterThan"
            contact_emails = ["test@domain.tld"]
            threshold = 90
        }]
    }]
}