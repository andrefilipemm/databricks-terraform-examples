include "root" {
    path   = find_in_parent_folders()
    expose = true
}

locals {
  module_version = include.root.locals.module_version
  aad_owners     = include.root.locals.aad_owners
}

inputs = {
  aad_owners        = local.aad_owners
  terraform_sp_name = "terraform-sp"
}

terraform {
  source = "git::https://github.com/andre-terraform-modules/terraform-aad-modules.git//bootstrap-terraform?ref=${local.module_version}"
}