output "escalation_policies_id" {
  description = "Map of id values across all escalation_policies, keyed the same as var.escalation_policies"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.id }
}
output "escalation_policies_description" {
  description = "Map of description values across all escalation_policies, keyed the same as var.escalation_policies"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.description }
}
output "escalation_policies_name" {
  description = "Map of name values across all escalation_policies, keyed the same as var.escalation_policies"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.name }
}
output "escalation_policies_num_loops" {
  description = "Map of num_loops values across all escalation_policies, keyed the same as var.escalation_policies"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.num_loops }
}
output "escalation_policies_rule" {
  description = "Map of rule values across all escalation_policies, keyed the same as var.escalation_policies"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.rule }
}
output "escalation_policies_teams" {
  description = "Map of teams values across all escalation_policies, keyed the same as var.escalation_policies"
  value       = { for k, v in pagerduty_escalation_policy.escalation_policies : k => v.teams }
}

