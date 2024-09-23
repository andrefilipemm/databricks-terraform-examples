# investigation-terraform-examples

This is just a mono-repository to work out various examples of infrastructure deployments across different cloud environments. The repo's built on a Terragrunt wrap-up from Terraform source code in [terraform-modules](https://github.com/orgs/andre-terraform-modules/repositories).

Ideally this repo should not contain a single `.tf` file, as all Terraform configuration is dinamically injected from dedicated module mono-repo in [terraform-modules](https://github.com/orgs/andre-terraform-modules/repositories).
For example, all AAD infrastructure is provisioned via [terraform-aad-modules](https://github.com/andre-terraform-modules/terraform-aad-modules).

TODO:
- Investigate usage of [artifactory](https://jfrog.com/help/r/jfrog-artifactory-documentation/resolve-terraform-modules) via JFrog. 
    - This allows module versioning in a segregated manner. Current setup makes use of GitHub tags, but the lowest resource allowed a tag is a repository which forces us to have a repository per-module if we want versioning per-module.
    If we make use of artifactory, we can have a mono-repository dedicated for terraform modules, where each repo's directory is a terraform module. This way we can publish each module one by one to artifactory with its dedicated version.
- Currently more than one `include {)` block is not yet supported by Terragrunt. There is however [initiave](https://github.com/gruntwork-io/terragrunt/issues/1566) to implement terragrunt `import {}` blocks which are planned to work in a similar fashion as it would nested `include {)` blocks. See also [here](https://medium.com/env0/terraform-dynamic-blocks-advanced-use-cases-and-examples-9891fbab98d7) to investigate better ways of using Terragrunt as a TF orchestrating tool.
