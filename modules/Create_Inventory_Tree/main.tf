data "vsphere_datacenter" "dc" {
  name                            = "${var.datacenter_id}"
}

resource "vsphere_folder" "parent" {
  depends_on                      = [var.depends_on_a]
  path                            = var.root_folder.folderName
  type                            = var.root_folder.folderType
  datacenter_id                   = "${data.vsphere_datacenter.dc.id}"
 }

resource "vsphere_folder" "folder" {
  depends_on                      = [var.depends_on_a]
  count                           = length(var.sub_folders) 
  path                            = format("%s/%s", vsphere_folder.parent.path, var.sub_folders[count.index].folderName)
  type                            = var.sub_folders[count.index].folderType
  datacenter_id                   = data.vsphere_datacenter.dc.id
}