variable projects {}

resource "vra_blueprint" "this" {
  name = "Simple VM"
  description = "Example blueprint for a simple VM deployment"

  count = length(var.projects)
  project_id = var.projects[count.index].id

  content = <<-EOT
    formatVersion: 1
    inputs:
      image:
        type: string
        description: "Image"
      flavor:
        type: string
        description: Flavor
        enum:
          - x-small
          - small
          - medium
          - large
          - x-large
    resources:
      Machine:
        type: Cloud.Machine
        properties:
          image: $${input.image}
          flavor: $${input.flavor}
  EOT
}




