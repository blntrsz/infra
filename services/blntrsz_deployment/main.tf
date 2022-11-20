variable vercel_cname { default = "cname.vercel-dns.com" }

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

resource "aws_route53_zone" "blntrsz" {
  name = "blntrsz.com"
}

# BLNTRSZ

resource "vercel_project" "blntrsz_vercel_project" {
  name      = "blntrsz"
  framework = "astro"
  git_repository = {
    type = "github"
    repo = "blntrsz/blntrsz.com"
  }
}

resource "vercel_project_domain" "vercel_project_domain" {
  project_id = vercel_project.blntrsz_vercel_project.id
  domain     = "blntrsz.com"
}

resource "vercel_project_domain" "blntrsz" {
  project_id           = vercel_project.blntrsz_vercel_project.id 
  domain               = "www.blntrsz.com"
  redirect             = "blntrsz.com"
  redirect_status_code = 307
}

resource "vercel_deployment" "vercel_deployment" {
  project_id = vercel_project.blntrsz_vercel_project.id
  ref        = "main" # or a git branch
}

resource "aws_route53_record" "default" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "blntrsz.com"
  type    = "A"
  ttl     = 300
  records = ["76.76.21.123"]
}

resource "aws_route53_record" "cname" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}

# OTHERS

module "json-formatter" {
  source     = "../../modules/blntrsz_deployment"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name       = "json-formatter"
  sub_domain = "json"
  framework  = "vite"
}

module "movieligent" {
  source     = "../../modules/blntrsz_deployment"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name       = "movieligent"
  sub_domain = "movieligent"
}

module "text-compare" {
  source     = "../../modules/blntrsz_deployment"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name       = "text-compare"
  sub_domain = "c"
  framework  = "vite"
}

module "url-shortener" {
  source     = "../../modules/blntrsz_deployment"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name       = "url-shortener"
  sub_domain = "link"
}

module "recipes" {
  source     = "../../modules/blntrsz_deployment"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name       = "recipes"
  sub_domain = "r"
  framework  = "astro"
}

