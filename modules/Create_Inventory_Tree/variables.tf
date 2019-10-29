variable "datacenter_id" {
}

variable "root_folder" {
  type = object({
    folderName = string
    folderType = string
  })
}

variable "sub_folders" {
  type = list(object({
    folderName = string
    folderType = string
  }))
}

variable "depends_on_a" {
  type = any
}