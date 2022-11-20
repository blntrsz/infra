terraform {
  backend "s3" {
    bucket         = "blntrsz-terraform-up-and-running-state"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}

module "budget" {
  source = "./services/budget"
}

module "blntrsz_deployment" {
  source = "./services/blntrsz_deployment"
}
