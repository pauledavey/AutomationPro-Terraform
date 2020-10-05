resource "vsphere_license" "licenseKey" {
 count                           = length(var.licenses) 
 license_key                     = var.licenses[count.index]
}