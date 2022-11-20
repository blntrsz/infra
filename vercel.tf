module "json-formatter" {
  source     = "./modules/blntrsz_vercel_deployment"
  name       = "json-formatter"
  sub_domain = "json"
  framework  = "vite"
}

module "text-compare" {
  source     = "./modules/blntrsz_vercel_deployment"
  name       = "text-compare"
  sub_domain = "c"
  framework  = "vite"
}

module "movieligent" {
  source     = "./modules/blntrsz_vercel_deployment"
  name       = "movieligent"
  sub_domain = "movieligent"
}

module "blntrsz" {
  source     = "./modules/blntrsz_vercel_deployment"
  name       = "blntrsz.com"
  sub_domain = ""
  has_dot = false
  framework  = "astro"
}

resource "vercel_project_domain" "blntrsz" {
  project_id           = module.blntrsz.project_id 
  domain               = "www.blntrsz.com"
  redirect             = "blntrsz.com"
  redirect_status_code = 307
}

module "url-shortener" {
  source     = "./modules/blntrsz_vercel_deployment"
  name       = "url-shortener"
  sub_domain = "link"
}

module "recipes" {
  source     = "./modules/blntrsz_vercel_deployment"
  name       = "recipes"
  sub_domain = "r"
  framework  = "astro"
}
