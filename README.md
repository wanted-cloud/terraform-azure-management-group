<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-management-group

Building block module to create and manage Azure Management Group.

## Usage

> TBA

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.20.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=4.20.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name or UUID for this Management Group, which needs to be unique across your tenant. A new UUID will be generated if not provided. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_budgets"></a> [budgets](#input\_budgets)

Description: List of budgets to be assigned under created resource group.

Type:

```hcl
list(
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
        contact_emails = optional(list(string))
        contact_groups = optional(list(string))
        contact_roles  = optional(list(string))
        enabled        = optional(bool, true)
        name           = string
        threshold      = number
        operator       = string
        threshold_type = optional(string)
      }))
    })
  )
```

Default: `[]`

### <a name="input_display_name"></a> [display\_name](#input\_display\_name)

Description: A friendly name for this Management Group. If not specified, this will be the same as the "name" variable.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
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

## Outputs

The following outputs are exported:

### <a name="output_management_group"></a> [management\_group](#output\_management\_group)

Description: Management Group object

### <a name="output_management_group_consumption_budget"></a> [management\_group\_consumption\_budget](#output\_management\_group\_consumption\_budget)

Description: Consumption Budget Management Group object

### <a name="output_management_group_subscription_association"></a> [management\_group\_subscription\_association](#output\_management\_group\_subscription\_association)

Description: Management Group Subscription Association object

## Resources

The following resources are used by this module:

- [azurerm_consumption_budget_management_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_management_group) (resource)
- [azurerm_management_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) (resource)
- [azurerm_management_group_subscription_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) (resource)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/resource-group/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "example" {
    source = "../.."
    
    name   = "example"
    display_name = "Example Management Group"
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->