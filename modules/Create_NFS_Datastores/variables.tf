variable "datacenter_id" {
}

variable esxi_hostnames {
  
}

variable "nfs_datastore_objects" {
  type = list(object({
    remote_host = string
    remote_path = string
    nfs_datastore_name = string
  }))
}

variable "depends_on_a" {
  type = any
}