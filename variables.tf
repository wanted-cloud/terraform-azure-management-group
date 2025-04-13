variable "name" {
  description = "The name or UUID for this Management Group, which needs to be unique across your tenant. A new UUID will be generated if not provided. Changing this forces a new resource to be created."
  type        = string

}

variable "display_name" {
  description = "A friendly name for this Management Group. If not specified, this will be the same as the \"name\" variable."
  type        = string
  default     = ""
}

variable "parent_group_id" {
  description = "The parent management group ID of the resource group to create."
  type        = string
  default     = ""
}

variable "subscriptions" {
  description = "List of subscription IDs to be assigned under management group."
  type        = list(string)
  default     = []
}

variable "budgets" {
  default     = []
  description = "List of budgets to be assigned under created resource group."
  type = list(
    object({
      name       = string
      amount     = number
      time_grain = optional(string)
      start_date = string
      end_date   = optional(string)
      filter = optional(object({
        dimensions = list(object({
          name   = string
          values = list(string)
        }))
        tags = list(object({
          name   = string
          values = list(string)
        }))
      }), null)
      notifications = list(object({
        contact_emails = list(string)
        enabled        = optional(bool, true)
        name           = string
        threshold      = number
        operator       = string
        threshold_type = optional(string)
      }))
    })
  )
}