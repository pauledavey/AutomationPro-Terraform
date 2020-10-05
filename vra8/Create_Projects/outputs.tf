output projects {
  value = [
    for p in vra_project.this: {
      id = p.id
      name = p.name
    }
  ]
}