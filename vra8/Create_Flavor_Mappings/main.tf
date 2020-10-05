variable regions {}
variable flavors {}

resource "vra_flavor_profile" "this" {
  name = "Terrform Flavor Profiles"
  region_id   = var.regions[0].region_id

  dynamic "flavor_mapping" {
    for_each = var.flavors

    content {
      name = flavor_mapping.value["name"]
      cpu_count = flavor_mapping.value["cpu_count"]
      memory = flavor_mapping.value["memory"]
    }
  }
}