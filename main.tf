resource "pagerduty_escalation_policy" "escalation_policies" {
  for_each = var.escalation_policies

  name        = each.value.name
  description = each.value.description
  num_loops   = each.value.num_loops
  teams       = each.value.teams

  dynamic "rule" {
    for_each = each.value.rule
    content {
      escalation_delay_in_minutes = rule.value.escalation_delay_in_minutes
      dynamic "escalation_rule_assignment_strategy" {
        for_each = rule.value.escalation_rule_assignment_strategy != null ? [rule.value.escalation_rule_assignment_strategy] : []
        content {
          type = escalation_rule_assignment_strategy.value.type
        }
      }
      dynamic "target" {
        for_each = rule.value.target
        content {
          id   = target.value.id
          type = target.value.type
        }
      }
    }
  }
}

