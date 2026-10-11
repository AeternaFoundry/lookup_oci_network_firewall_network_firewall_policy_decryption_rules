data "oci_network_firewall_network_firewall_policy_decryption_rules" "network_firewall_network_firewall_policy_decryption_rules_lookup" {
  for_each = var.network_firewall_network_firewall_policy_decryption_rules_lookup

  network_firewall_policy_id     = each.value.network_firewall_policy_id
  decryption_rule_priority_order = each.value.decryption_rule_priority_order
  display_name                   = each.value.display_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

