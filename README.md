# databricks-terraform-examples

This is just a mono-repository to work out various examples of infrastructure deployments across different cloud environments. The repo's built on a Terragrunt wrap-up from Terraform source code in [terraform-modules](https://github.com/andrefilipemm/terraform-modules).

Ideally this repo should not contain a single `.tf` file, as all Terraform configuration is dinamically injected from module mono-repo in [terraform-modules](https://github.com/andrefilipemm/terraform-modules).

TODO:
- Investigate usage of [artifactory](https://jfrog.com/help/r/jfrog-artifactory-documentation/resolve-terraform-modules) via JFrog. 
    - This allows module versioning in a segregated manner. Current setup makes use of GitHub tags, but the lowest resource allowed a tag is a repository which forces us to have a repository per-module if we want versioning per-module.
    If we make use of artifactory, we can have a mono-repository dedicated for terraform modules, where each repo's directory is a terraform module. This way we can publish each module one by one to artifactory with its dedicated version.