terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
  required_version = ">= 0.13"
}
