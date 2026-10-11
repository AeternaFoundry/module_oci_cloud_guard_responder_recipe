variable "cloud_guard_responder_recipes" {
  description = <<EOT
Map of cloud_guard_responder_recipes, attributes below
Required:
    - compartment_id
    - display_name
    - source_responder_recipe_id
Optional:
    - defined_tags
    - description
    - freeform_tags
    - responder_rules (block):
        - compartment_id (optional)
        - details (required, block):
            - is_enabled (required)
        - responder_rule_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id             = string
    display_name               = string
    source_responder_recipe_id = string
    defined_tags               = optional(map(string))
    description                = optional(string)
    freeform_tags              = optional(map(string))
    responder_rules = optional(list(object({
      compartment_id = optional(string)
      details = object({
        is_enabled = bool
      })
      responder_rule_id = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

