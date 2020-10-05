output entitlementInfo {
  value = [
    for e in vra_catalog_source_entitlement.this: {
      id = e.id
    }
  ]
}