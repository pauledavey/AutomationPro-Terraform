variable blueprint_ids {}

resource "vra_blueprint_version" "this" {

  count = length(var.blueprint_ids)
  blueprint_id = var.blueprint_ids[count.index].id
  description  = "Released from vRA terraform provider"
  version      = "1.0"
  release      = true
  change_log   = "First version"
}