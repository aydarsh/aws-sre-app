provider "aws" {
  version = "~> 3.0"
  region  = "us-east-2"
  profile = "default"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-sre-devops"

    workspaces {
      prefix = "aws-sre-app"
    }
  }
}