terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "elioseverojunior"
    workspaces {
      name = "github-oidc-prod"
    }
  }
}
