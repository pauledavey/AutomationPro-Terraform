variable "datacenter_id" {
  description = "Datacenter id to build the dvSwitch upon"
}

// The name of the distributed virtual switch to create.
variable "switch_name" {
  description = "The name of the dvSwitch to create"
}

variable "switch_version" {

}

variable "esxi_hosts" {
	
}

variable "depends_on_a" {
  type = any
}

variable "network_interfaces" {
}

variable "all_uplinks" {
  type = list(string)
}

variable "active_uplinks" {
  type = list(string)
}

variable "standby_uplinks" {
  type = list(string)
}