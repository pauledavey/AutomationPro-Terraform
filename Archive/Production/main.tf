# variable declarations
variable "datacenter_name" {}
variable "cluster_name" {}
variable "drs_enabled" {}
variable "drs_automation_level" {}
variable "drs_enable_predictive_drs" {}
variable "ha_enabled" {}
variable "esxi_hosts" {}
variable "nfs_datastore_objects" {}
variable "datastore_cluster_name" {}
variable "nfs_datastore_cluster_objects" {}
variable "inventory_root_folder" {}
variable "inventory_sub_folders" {}
variable "switch_name" {}
variable "switch_version" {}
variable "network_interfaces" {}
variable "all_uplinks" {}
variable "active_uplinks" {}
variable "standby_uplinks" {}
variable "portgroup_objects_to_create" {}
variable "resource_pools_to_create" {}
variable "licenses" {}

module "configure_licensing" {
  source = "./../modules/Configure_Licensing"
  licenses = var.licenses
}

module "deploy_cluster" {
  source = "./../modules/Create_Cluster"
    datacenter_id = var.datacenter_name
    cluster_name = var.cluster_name
    drs_enabled = var.drs_enabled
    drs_automation_level = var.drs_automation_level
    drs_enable_predictive_drs = var.drs_enable_predictive_drs
    ha_enabled = var.ha_enabled
    esxi_hosts = var.esxi_hosts
}

module "deploy_nfs_datastores1" {
  depends_on_a = [module.deploy_cluster]
  source = "./../modules/Create_NFS_Datastores"
    datacenter_id = var.datacenter_name
    esxi_hostnames = var.esxi_hosts
    nfs_datastore_objects = var.nfs_datastore_objects
}

module "deploy_nfs_datastores_cluster" {
  depends_on_a = [module.deploy_cluster]
  source = "./../modules/Create_NFS_Datastore_Cluster"
    datacenter_id = var.datacenter_name
    datastore_cluster_name = var.cluster_name
    esxi_hostnames = var.esxi_hosts
    nfs_datastore_objects = var.nfs_datastore_cluster_objects
}

module "deploy_inventory_tree" {
  depends_on_a = [module.deploy_cluster]
  source = "./../modules/Create_Inventory_Tree"
    datacenter_id = var.datacenter_name
    root_folder = var.inventory_root_folder
    sub_folders = var.inventory_sub_folders
}

module "deploy_dvSwitch" {
  depends_on_a = [module.deploy_cluster]
  source = "./../modules/Create_dvSwitch"
    datacenter_id = var.datacenter_name
    switch_name = var.switch_name
    switch_version = var.switch_version
    network_interfaces = var.network_interfaces
    all_uplinks = var.all_uplinks
    active_uplinks = var.active_uplinks
    standby_uplinks = var.standby_uplinks
    esxi_hosts = var.esxi_hosts
}

module "create_resource_pools" {
  depends_on_a = [module.deploy_dvSwitch]
  source = "./../modules/Create_Resource_Pools"
    datacenter_id = var.datacenter_name
    cluster_name = var.cluster_name
    resource_pools_to_create = var.resource_pools_to_create
}

module "deploy_dvSwitch_portgroups" {
    depends_on_a = [module.deploy_dvSwitch]
    source = "./../modules/Create_Portgroups_On_DvSwitch"
    dvSwitch_id = module.deploy_dvSwitch.dvSwitch_id
    portgroup_objects_to_create = var.portgroup_objects_to_create
}

