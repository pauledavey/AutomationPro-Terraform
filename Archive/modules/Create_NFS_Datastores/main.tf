data "vsphere_datacenter" "dc" {
  name = "${var.datacenter_id}"
}

data "vsphere_host" "esxi_hosts" {
  count         = length(var.esxi_hostnames)
  name          = var.esxi_hostnames[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_nas_datastore" "datastore" {
  depends_on = [var.depends_on_a]
  count = length(var.nfs_datastore_objects)
  name            = var.nfs_datastore_objects[count.index].nfs_datastore_name
  host_system_ids = data.vsphere_host.esxi_hosts.*.id
  type         = "NFS"
  remote_hosts = [var.nfs_datastore_objects[count.index].remote_host]
  remote_path  = var.nfs_datastore_objects[count.index].remote_path
}