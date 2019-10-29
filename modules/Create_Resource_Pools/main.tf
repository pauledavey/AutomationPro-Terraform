data "vsphere_datacenter" "dc" {
  name = "${var.datacenter_id}"
}

data "vsphere_compute_cluster" "compute_cluster" {
  depends_on                      = [var.depends_on_a]
  name          = "${var.cluster_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_resource_pool" "resource_pool" {
 count                           = length(var.resource_pools_to_create) 
 name                            = var.resource_pools_to_create[count.index].resourcePool_name
 parent_resource_pool_id         = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
 cpu_share_level                 = var.resource_pools_to_create[count.index].resourcePool_cpu_share_level
 cpu_reservation                 = var.resource_pools_to_create[count.index].resourcePool_cpu_reservation
 memory_share_level              = var.resource_pools_to_create[count.index].resourcePool_memory_share_level
 memory_reservation              = var.resource_pools_to_create[count.index].resourcePool_memory_reservation
}