#
# variables
#
variable "vsphere_username" {}
variable "vsphere_password" {}
variable "ubuntu_password" {
  default = null
}
variable "openshift_pull_secret" {}

variable "vsphere_server" {
  default = "wdc-06-vc12.oc.vmware.com"
}

variable "vcenter_dc" {
  default = "wdc-06-vc12"
}

variable "vcenter_cluster" {
  default = "wdc-06-vc12c01"
}

variable "vcenter_datastore" {
  default = "wdc-06-vc12c01-vsan"
}

variable "vcenter_network_mgmt_name" {
  default = "vxw-dvs-34-virtualwire-3-sid-6120002-wdc-06-vc12-avi-mgmt"
}

variable "vcenter_folder" {
  default = "tf_ako_openshift_demo"
}

variable "ubuntu_ip4_addresses" {
  default = ["10.206.112.56/22", "10.206.112.57/22"]
}

variable "gateway4" {
  default = "10.206.112.1"
}

variable "nameservers" {
  default = "10.206.8.130, 10.206.8.130, 10.206.8.131"
}

variable "domain" {
  default = "avi.com"
}

variable "openshift_cluster_name" {
  default = "cluster1"
}

variable "openshift_api_ip" {
  default = "10.206.112.78"
}

variable "openshift_ingress_ip" {
  default = "10.206.112.79"
}

variable "ssh_key" {
  type = map
  default = {
    algorithm            = "RSA"
    rsa_bits             = "4096"
    private_key_name = "ssh_private_key_tf_openshift"
    file_permission      = "0600"
  }
}

variable "dhcp" {
  default = true
}

variable "content_library" {
  default = {
    basename = "content_library_tf_"
    source_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.ova"
  }
}

variable "ubuntu" {
  type = map
  default = {
    basename = "ubuntu-tf-"
    count = 1
    username = "ubuntu"
    cpu = 8
    if_name = "ens192"
    memory = 8192
    disk = 12
    wait_for_guest_net_routable = "false"
    net_plan_file = "/etc/netplan/50-cloud-init.yaml"
  }
}

variable "dns" {
  default = {
    basename = "dns-tf-"
    username = "ubuntu"
    cpu = 4
    if_name = "ens192"
    memory = 4096
    disk = 12
    wait_for_guest_net_routable = "false"
    net_plan_file = "/etc/netplan/50-cloud-init.yaml"
    bind = {
      key_name = "my_key_name"
    }
  }
}