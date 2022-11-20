terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "aws_route53_record" "cname" {
  zone_id = var.zone_id
  name    = var.sub_domain
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
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

resource "vercel_deployment" "vercel_deployment" {
  project_id = vercel_project.vercel_project.id
  ref        = "main" # or a git branch
}
