terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "vercel_project" {
  name      = replace(var.name, ".", "-")
  framework = var.framework
  git_repository = {
    type = "github"
    repo = "blntrsz/${var.name}"
  }
}

resource "vercel_project_domain" "vercel_project_domain" {
  project_id = vercel_project.vercel_project.id
  domain     = "${var.sub_domain}${var.has_dot ? ".": ""}blntrsz.com"
}
