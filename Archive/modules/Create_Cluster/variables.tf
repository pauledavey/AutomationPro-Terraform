// The datacenters to create.
variable "datacenter_id" {
}

variable "cluster_name" {
  description = "The name of the cluster to create under the specified datacenter" 
}

variable "drs_enabled" {
  description = "(optional)enables DRS [true] or disables DRS [false]. Default is false"
  default = false
}

variable "drs_automation_level" {
  description = "(optional)sets DRS automation level [manual, partiallyAutomated, fullAutomated]- default is "
  default = "manual"
}

variable "ha_enabled" {
  description = "(optional)enables HA (true) or disables HA (false). Default is false"
  default = false
}

variable "drs_migration_threshold" {
  description = "(optional)A value between 1 and 5 indicating the threshold of imbalance tolerated between hosts. A lower setting will tolerate more imbalance while a higher setting will tolerate less. Default value is 3"
  default = 3
}

variable "drs_enable_vm_overrides" {
  description = "(optional)Allow individual DRS overrides to be set for virtual machines in the cluster. Default value is true"
  default = true
}

variable "drs_enable_predictive_drs" {
  description = "(optional)When true, enables DRS to use data from vRealize Operations Manager to make proactive DRS recommendations. Default value is false"
  default = false
}

variable "esxi_hosts" {
  
}
