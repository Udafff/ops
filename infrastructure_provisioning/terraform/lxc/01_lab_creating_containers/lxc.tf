# provider to connect to infrastructure
provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true
  lxd_remote {
    name    = "lxd-server-1"
    scheme  = "https"
    address = "localhost"
    #    password = "pass"
    default = true
  }
}

# image resources
# images:debian/11/cloud
resource "lxd_cached_image" "debian11" {
  source_remote = "images"
  source_image  = "debian/11/cloud"
}

# ubuntu
resource "lxd_cached_image" "ubuntu2004" {
  source_remote = "ubuntu"
  source_image  = "20.04"
}

# images:centos/8/cloud
resource "lxd_cached_image" "centos8" {
  source_remote = "images"
  source_image  = "centos/8/cloud"
}


# containers
resource "lxd_container" "debian-srv01" {
  config    = {}
  ephemeral = false
  limits = {
    "memory" = "128MB"
    "cpu"    = 1
  }
  name = "${terraform.workspace}-debian-srv01"
  profiles = [
    "profile_01",
  ]
  image            = lxd_cached_image.debian11.fingerprint
  wait_for_network = false
}

resource "lxd_container" "ubuntu-srv01" {
  config    = {}
  ephemeral = false
  limits = {
    "memory" = "128MB"
    "cpu"    = 1
  }
  name = "${terraform.workspace}-ubuntu-srv01"
  profiles = [
    "profile_01",
  ]
  image            = lxd_cached_image.ubuntu2004.fingerprint
  wait_for_network = false
}

resource "lxd_container" "centos-srv01" {
  config    = {}
  ephemeral = false
  limits = {
    "memory" = "128MB"
    "cpu"    = 1
  }
  name = "${terraform.workspace}-centos-srv01"
  profiles = [
    "profile_01",
  ]
  image            = lxd_cached_image.centos8.fingerprint
  wait_for_network = false
}

