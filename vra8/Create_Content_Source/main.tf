variable projects {}

resource "vra_catalog_source_blueprint" "this" {
    count = length(var.projects)
    project_id = var.projects[count.index].id
    name       = var.projects[count.index].name
}