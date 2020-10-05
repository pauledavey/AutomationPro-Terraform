variable cloud_account {}
variable regions {}

# Create Cloud Zones
resource "vra_zone" "zone" {
  name        = var.cloud_account.zone.name
  description = var.cloud_account.zone.name
  region_id   = var.regions[0].region_id
}