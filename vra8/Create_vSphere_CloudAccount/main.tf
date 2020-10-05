variable cloud_account {}
variable vcenter_username {}
variable vcenter_password {}
variable vcenter_hostname {}

data vsphere_datacenter "this" {
  for_each = toset(var.cloud_account.datacenters)
  name     = each.value
}

# Create Cloud Account
resource "vra_cloud_account_vsphere" "this" {
  name        = replace(var.cloud_account.name, " ", "_")
  description = "AutomationPro vSphere Cloud Account"
  username    = var.vcenter_username
  password    = var.vcenter_password
  hostname    = var.vcenter_hostname
  regions     = [for v in data.vsphere_datacenter.this: format("Datacenter:%s", v.id)]
  accept_self_signed_cert      = true

  dynamic tags {
    for_each = var.cloud_account.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}