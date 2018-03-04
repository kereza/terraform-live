provider "aws" {
 region = "us-east-1"
}

resource "aws_vpc" "kereza_vpc" {
 cidr_block = "10.10.0.0/16"
 tags {
  Name = "kereza-test"
 }
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-kereza"
    key    = "global/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}


