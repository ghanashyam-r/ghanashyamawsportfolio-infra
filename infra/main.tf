terraform {
  required_version = "~> 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
     archive = {
    source  = "hashicorp/archive"
    version = "~> 2.4"
  }
  }

  backend "s3" {
    bucket       = "ghana-tf-state"
    key          = "portfolio/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}