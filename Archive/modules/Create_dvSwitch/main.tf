data "vsphere_datacenter" "dc" {
  name = "${var.datacenter_id}"
}

data "vsphere_host" "esxi_hosts" {
  count         = length(var.esxi_hosts)
  name          = var.esxi_hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_distributed_virtual_switch" "dvs" {
  # Using a depends on method because I always want the cluster to be created
  # with the host placed into it before the dvSwitch is created and the
  # host is connected. This is neccesary but I feel happier with this
  # being handled in this way
  depends_on = [var.depends_on_a]
  name          = var.switch_name
  datacenter_id = data.vsphere_datacenter.dc.id
  version = var.switch_version
  uplinks         = var.all_uplinks
  active_uplinks  = var.active_uplinks
  standby_uplinks = var.standby_uplinks

    dynamic "host" {
       for_each = data.vsphere_host.esxi_hosts
       content {
         host_system_id = host.value.id
         devices = var.network_interfaces 
       }
     }
}
