output cloud_zone {
  # value = tomap([
  #   for k, v in vra_zone.zone: {
  #     "name" = v.name,
  #     "id" = v.id
  #   }
  # ])

  value = {
    "name" = vra_zone.zone.name,
    "id"   = vra_zone.zone.id
  }
}