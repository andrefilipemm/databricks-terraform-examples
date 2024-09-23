locals {
  repo_root      = dirname(find_in_parent_folders("repo-root.txt"))
  module_version = run_cmd("bash", "${local.repo_root}/update-module-version.sh")

  aad_owners = [
    "3f0d9f74-8584-448b-9ed2-50039e84f72b", # andre martins
  ]
}

generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azuread" {
  tenant_id     = "${get_env("AZRM_TENANT_ID")}"
  client_id     = "${get_env("TFAUTH_CLIENT_ID")}"
  client_secret = "${get_env("TFAUTH_CLIENT_SECRET")}"
}

provider "azurerm" {
  subscription_id = "${get_env("AZRM_SUBSCRIPTION_ID")}"
  tenant_id       = "${get_env("AZRM_TENANT_ID")}"
  client_id       = "${get_env("TFAUTH_CLIENT_ID")}"
  client_secret   = "${get_env("TFAUTH_CLIENT_SECRET")}"
  features {}
}
EOF
}

# Never plan this root
skip = true