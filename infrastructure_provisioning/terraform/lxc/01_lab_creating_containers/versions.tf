terraform {
  required_providers {
    lxd = {
      # TF-UPGRADE-TODO
      #
      # No source detected for this provider. You must add a source address
      # in the following format:
      #
      # source = "your-registry.example.com/organization/lxd"
      #
      # For more information, see the provider source documentation:
      #
      # https://www.terraform.io/docs/configuration/providers.html#provider-source
      source = "local/community/lxd"
    }
  }
  required_version = ">= 0.13"
}
