terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "elioseverojunior"
    workspaces {
      prefix = "github-oidc-prod"
    }
  }
}
