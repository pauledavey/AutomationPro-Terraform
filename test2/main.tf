variable vcenterCreds {}

provider vsphere {
  user                 = var.vcenterCreds.vcenter_username
  password             = var.vcenterCreds.vcenter_password
  vsphere_server       = var.vcenterCreds.vcenter_hostname
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "AutomationPro"
}

data "vsphere_datastore" "datastore" {
  name          = "esxinuc1ssd01"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "APRO-SURREY"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 1024
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 1
  }
}