#
# Jalgraves 2021
#

provider "aws" {
  region = "us-west-2"
}

locals {
  tags = {
    "Module"      = "terraform-aws-network",
    "Provisioner" = "Terratest"
  }
}

module "network" {
  source = "../.."

  allow_ssh_from_ip               = var.my_ip
  availability_zones              = ["us-west-2a", "us-west-2b"]
  create_ssh_sg                   = false
  default_security_group_deny_all = true
  environment                     = "dev"
  cidr_block                      = "10.0.0.0/16"
  internet_gateway_enabled        = true
  label_create_enabled            = true
  nat_gateway_enabled             = false
  nat_instance_enabled            = false
  region_code = "usw2"
  tags                            = local.tags
}
