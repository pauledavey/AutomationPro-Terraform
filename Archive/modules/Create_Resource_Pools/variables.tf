variable "datacenter_id" {
}

variable "cluster_name" {
  description = "Cluster name to create the resource pools under"
}

variable "resource_pools_to_create" {
  type = list(object({
    resourcePool_name = string
    resourcePool_cpu_share_level = string
    resourcePool_cpu_reservation = number
    resourcePool_memory_share_level = string
    resourcePool_memory_reservation = number
  }))
}

variable "depends_on_a" {
  type = any
}