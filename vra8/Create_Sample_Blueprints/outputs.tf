output blueprint_ids {
  value = [
    for b in vra_blueprint.this: {
      id = b.id
    }
  ]
}