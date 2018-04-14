provider "aws" {
 region = "us-east-1"
}

module "instances" {
 source = "git@github.com:kereza/terraform-modules.git//instances?ref=0.1.1"

 remote_key = "prod/subnet/terraform.tfstate"
 private_ips = "10.10.20.10"
 ami = "ami-02e98f78"
 instance_type = "t2.micro"
 tag = "prod-test1"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-kereza"
    key    = "prod/instances/terraform.tfstate"
    region = "us-east-1"
  }
}
