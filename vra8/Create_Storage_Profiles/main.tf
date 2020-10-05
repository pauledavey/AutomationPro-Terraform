variable cloud_account {}
variable storage_profiles {}
variable regions {}

locals {
  regionId = var.regions[0].region_id
}

resource "vra_storage_profile" "this" {

    for_each = { for s in var.storage_profiles : s.name => s }
    name = each.value.name
    description = each.value.description
    region_id   = local.regionId
    default_item = each.value.default_item
    
    disk_properties = {
        independent      = each.value.independent
        persistent       = each.value.persistent
        limitIops        = each.value.limitIops
        provisioningType = each.value.provisioningType
        sharesLevel      = each.value.sharesLevel
  }
}