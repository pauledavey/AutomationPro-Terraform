variable catalog_source_id_info {}

resource "vra_catalog_source_entitlement" "this" {
    count = length(var.catalog_source_id_info)
    catalog_source_id = var.catalog_source_id_info[count.index].cat_source_id
    project_id        = var.catalog_source_id_info[count.index].project_id
}