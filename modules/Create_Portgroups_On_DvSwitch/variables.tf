variable "dvSwitch_id" {
  description = "The id of the dvSwitch"
}

variable "portgroup_objects_to_create" {
  type = list(object({
    portgroup_name = string
    portgroup_vlanId = number
    portgroup_type = string
    portgroup_description = string
    portgroup_num_of_ports = number
    portgroup_auto_expand = bool
  }))
}

variable "depends_on_a" {
  type = any
}