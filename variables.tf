variable "escalation_policies" {
  description = <<EOT
Map of escalation_policies, attributes below
Required:
    - name
    - rule (block):
        - escalation_delay_in_minutes (required)
        - escalation_rule_assignment_strategy (optional, block):
            - type (optional)
        - target (required, block):
            - id (required)
            - type (optional)
Optional:
    - description
    - num_loops
    - teams
EOT

  type = map(object({
    name        = string
    description = optional(string)
    num_loops   = optional(number)
    teams       = optional(list(string))
    rule = list(object({
      escalation_delay_in_minutes = number
      escalation_rule_assignment_strategy = optional(object({
        type = optional(string)
      }))
      target = list(object({
        id   = string
        type = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.escalation_policies : (
        length(v.rule) >= 1
      )
    ])
    error_message = "Each rule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.escalation_policies : (
        alltrue([for item in v.rule : (length(item.target) >= 1)])
      )
    ])
    error_message = "Each target list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.escalation_policies : (
        v.num_loops == null || (v.num_loops >= 0 && v.num_loops <= 9)
      )
    ])
    error_message = "must be between 0 and 9"
  }
  validation {
    condition = alltrue([
      for k, v in var.escalation_policies : (
        alltrue([for item in v.rule : (item.escalation_delay_in_minutes >= 1)])
      )
    ])
    error_message = "must be at least 1"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

