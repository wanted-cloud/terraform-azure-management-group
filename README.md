<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-management-group

Building block module to create and manage Azure Management Group.

## Usage

> TBA

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=3.113.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=3.113.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_consumption_budget_management_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_management_group) (resource)
- [azurerm_management_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) (resource)
- [azurerm_management_group_subscription_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name or UUID for this Management Group, which needs to be unique across your tenant. A new UUID will be generated if not provided. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_budgets"></a> [budgets](#input\_budgets)

Description: List of budgets to be assigned under management group.

Type:

```hcl
list(object({
    name       = string
    amount     = number
    time_grain = string
    start_date = string
    end_date   = string
    filter = object({
      dimension = list(object({
        name   = string
        values = list(string)
      }))
      tag = list(object({
        name   = string
        values = list(string)
      }))
    })
    notifications = list(object({
      enabled        = bool
      threshold      = number
      operator       = string
      threshold_type = string
      contact_emails = list(string)
    }))
  }))
```

Default: `[]`

### <a name="input_display_name"></a> [display\_name](#input\_display\_name)

Description: A friendly name for this Management Group. If not specified, this will be the same as the "name" variable.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Module metadata object to give user possibility to override default module values.

Type:

```hcl
object({
    default_tags             = optional(map(string), {})
    resource_timeouts        = optional(map(map(string)), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_parent_group_id"></a> [parent\_group\_id](#input\_parent\_group\_id)

Description: The parent management group ID of the resource group to create.

Type: `string`

Default: `""`

### <a name="input_subscription_ids"></a> [subscription\_ids](#input\_subscription\_ids)

Description: List of subscription IDs to be assigned under management group.

Type: `list(string)`

Default: `[]`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key value pairs of custom tags to be applied to the module resources.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_management_group"></a> [management\_group](#output\_management\_group)

Description: Management Group object

### <a name="output_management_group_consumption_budget"></a> [management\_group\_consumption\_budget](#output\_management\_group\_consumption\_budget)

Description: Consumption Budget Management Group object

### <a name="output_management_group_subscription_association"></a> [management\_group\_subscription\_association](#output\_management\_group\_subscription\_association)

Description: Management Group Subscription Association object

Created by WANTED.solutions s.r.o.
---
<sup><sub>_2024 &copy; All rights reserved - WANTED.solutions s.r.o. [<@wanted-solutions>](https://github.com/wanted-solutions)_</sub></sup>
<!-- END_TF_DOCS -->