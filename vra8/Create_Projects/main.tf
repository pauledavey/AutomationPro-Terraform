variable cloud_account {}
variable zoneInfo {}

# Create each specified project
resource "vra_project" "this" {
  
  for_each = { for proj in var.cloud_account.projects : proj.name => proj }
  name = each.value.name
  description = each.value.description
  administrators = each.value.administrators
  
  machine_naming_template = each.value.machine_naming_template
  zone_assignments {
    zone_id       = var.zoneInfo.id
    priority      = 1
    max_instances = 0
  }
}