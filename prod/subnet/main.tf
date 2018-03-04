provider "aws" {
 region = "us-east-1"
}

module "subnet" {
 source = "git@github.com:kereza/terraform-modules.git//subnet?ref=v0.1.1"
 
 subnet = "10.10.20.0/24"
 availability-zone = "us-east-1a"
 subnet-name = "prod-private"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-kereza"
    key    = "prod/subnet/terraform.tfstate"
    region = "us-east-1"
  }
}
