include "root" {
    path   = find_in_parent_folders()
    expose = true
}

locals {
    module_version = include.root.locals.module_version
}

inputs = {
    groups = lookup(yamldecode(file("${get_terragrunt_dir()}/main.yaml")), "groups", {})
}

terraform {
    source = "git::https://github.com/andre-terraform-modules/terraform-aad-modules.git//users-groups?ref=${local.module_version}"
}