resource "oci_cloud_guard_responder_recipe" "cloud_guard_responder_recipes" {
  for_each = var.cloud_guard_responder_recipes

  compartment_id             = each.value.compartment_id
  display_name               = each.value.display_name
  source_responder_recipe_id = each.value.source_responder_recipe_id
  defined_tags               = each.value.defined_tags
  description                = each.value.description
  freeform_tags              = each.value.freeform_tags

  dynamic "responder_rules" {
    for_each = each.value.responder_rules != null ? each.value.responder_rules : []
    content {
      compartment_id = responder_rules.value.compartment_id
      details {
        is_enabled = responder_rules.value.details.is_enabled
      }
      responder_rule_id = responder_rules.value.responder_rule_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

