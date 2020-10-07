variable vraCreds {}
variable vcenterCreds {}

provider vra {
  url           = var.vraCreds.vra_url
  refresh_token = var.vraCreds.vra_refresh_token
  insecure      = true
}

provider vsphere {
  user                 = var.vcenterCreds.vcenter_username
  password             = var.vcenterCreds.vcenter_password
  vsphere_server       = var.vcenterCreds.vcenter_hostname
  allow_unverified_ssl = true
}

data "vra_region_enumeration_vsphere" "this" {
  username                = var.vcenterCreds.vcenter_username
  password                = var.vcenterCreds.vcenter_password
  hostname                = var.vcenterCreds.vcenter_hostname
  accept_self_signed_cert = true
}

data "vra_region" "this" {
  cloud_account_id = data.vra_cloud_account_vsphere.this.id
  region           = data.vra_region_enumeration_vsphere.this.regions[0]
}

#data "vra_region" "this" {
#  cloud_account_id = data.vra_cloud_account_vsphere.this.id
#  region           = "vSphere_Automation"
#}

#resource "vra_flavor_profile" "this" {
#  name = "Terrform Flavor Profiles B"
#  region_id   = data.vra_cloud_account_vsphere.this.enabled_region_ids[0]
#  flavor_mapping {
#    name = "test"
#    cpu_count = 1
#    memory = 1024
#  }
#}

output "testicles" {
  value = data.vra_region.this
}