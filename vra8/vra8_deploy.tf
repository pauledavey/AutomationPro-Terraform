variable vcenterCreds {}
variable vraCreds {}
variable cloud_account {}

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

module "CloudAccount" {
    source = "./Create_vSphere_CloudAccount"
    cloud_account = var.cloud_account
    vcenter_username = var.vcenterCreds.vcenter_username
    vcenter_password = var.vcenterCreds.vcenter_password
    vcenter_hostname = var.vcenterCreds.vcenter_hostname
}

module "CloudZone" {
    source = "./Create_Cloud_Zone"
    regions = module.CloudAccount.enabled_region
    cloud_account = var.cloud_account
}

module "Projects" {
    source = "./Create_Projects"
    cloud_account = var.cloud_account
    zoneInfo       = module.CloudZone.cloud_zone
}

module "Flavor_Mappings" {
    source = "./Create_Flavor_Mappings"
    regions = module.CloudAccount.enabled_region
    flavors = var.cloud_account.flavors
}

module "Sample_Blueprint" {
  source = "./Create_Sample_Blueprints"
  projects = module.Projects.projects
}

module "Release_Sample_Blueprint" {
  source = "./Release_Sample_Blueprint"
  blueprint_ids = module.Sample_Blueprint.blueprint_ids
}

module "Create_Content_Source" {
  source = "./Create_Content_Source"
  projects = module.Projects.projects
}

module "Create_Content_Sharing_For_Content_Source" {
  source = "./Create_Content_Sharing_For_Content_Source"
  catalog_source_id_info = module.Create_Content_Source.catalog_source_id_info
}

module "Storage_Profiles" {
    source = "./Create_Storage_Profiles"
    regions = module.CloudAccount.enabled_region
    cloud_account = var.cloud_account
    storage_profiles = var.cloud_account.storage_profiles
}