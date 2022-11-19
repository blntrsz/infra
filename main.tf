terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "blntrsz-terraform-up-and-running-state"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}
