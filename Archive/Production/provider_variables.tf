# Variables section for vSphere connectivity
variable "vsphere_server" {
  description = "fqdn for the vsphere server for the environment"
  default     = "testvc.automationcore.xtravirt.com"
}

variable "vsphere_user" {
  description = "user with sufficient rights to vsphere server for the environment"
  default     = "administrator@vsphere.local"
}

variable "vsphere_password" {
  description = "vsphere server password for the environment"
  default     = "Xtrav1rt!"
}

variable "allow_unverified_ssl" {
  description = "specify whether we can use unverified ssl certificates"
  default     = true
}

