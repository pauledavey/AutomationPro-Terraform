output catalog_source_id_info {
  value = [
    for c in vra_catalog_source_blueprint.this: {
      cat_source_id = c.id
      project_id = c.project_id
    }
  ]
}