output "escalation_policies_id" {
  description = "Map of id values across all escalation_policies, keyed the same as var.escalation_policies except keys with no id are omitted"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "escalation_policies_description" {
  description = "Map of description values across all escalation_policies, keyed the same as var.escalation_policies except keys with no description are omitted"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.description if v.description != null && length(v.description) > 0 }
}
output "escalation_policies_name" {
  description = "Map of name values across all escalation_policies, keyed the same as var.escalation_policies except keys with no name are omitted"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "escalation_policies_num_loops" {
  description = "Map of num_loops values across all escalation_policies, keyed the same as var.escalation_policies except keys with no num_loops are omitted"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.num_loops if v.num_loops != null }
}
output "escalation_policies_rule" {
  description = "Map of rule values across all escalation_policies, keyed the same as var.escalation_policies except keys with no rule are omitted"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.rule if v.rule != null && length(v.rule) > 0 }
}
output "escalation_policies_teams" {
  description = "Map of teams values across all escalation_policies, keyed the same as var.escalation_policies except keys with no teams are omitted"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.teams if v.teams != null && length(v.teams) > 0 }
}

