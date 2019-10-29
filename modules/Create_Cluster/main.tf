data "vsphere_datacenter" "dc" {
  name = "${var.datacenter_id}"
}

data "vsphere_host" "hosts" {
  count         = length(var.esxi_hosts)
  name          = var.esxi_hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_compute_cluster" "tf_clusters" {
  name            = var.cluster_name
  datacenter_id   = "${data.vsphere_datacenter.dc.id}"
  drs_enabled          = var.drs_enabled
  drs_automation_level = var.drs_automation_level
  drs_migration_threshold = var.drs_migration_threshold
  drs_enable_vm_overrides = var.drs_enable_vm_overrides
  drs_enable_predictive_drs = var.drs_enable_predictive_drs
  ha_enabled = true
  host_system_ids = data.vsphere_host.hosts.*.id
}