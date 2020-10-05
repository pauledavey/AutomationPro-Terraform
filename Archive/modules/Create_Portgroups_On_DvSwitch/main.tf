resource "vsphere_distributed_port_group" "port_group" {
 depends_on                      = [var.depends_on_a]
 count                           = length(var.portgroup_objects_to_create) 
 distributed_virtual_switch_uuid = var.dvSwitch_id
 name                            = var.portgroup_objects_to_create[count.index].portgroup_name
 vlan_id                         = var.portgroup_objects_to_create[count.index].portgroup_vlanId
 type                            = var.portgroup_objects_to_create[count.index].portgroup_type
 description                     = var.portgroup_objects_to_create[count.index].portgroup_description
 number_of_ports                 = var.portgroup_objects_to_create[count.index].portgroup_num_of_ports
 auto_expand                     = var.portgroup_objects_to_create[count.index].portgroup_auto_expand
}