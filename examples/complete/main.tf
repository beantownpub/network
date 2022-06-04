# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+-+-+
# |*|*|*|*| |J|A|L|G|R|A|V|E|S| |*|*|*|*|
# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+-+-+
# 2022

provider "aws" {
  region = "us-west-2"
}

locals {
  tags = {
    "Module"      = "terraform-aws-network",
    "Provisioner" = "terratest"
  }
  subnet_tags = {
    "kubernetes.io/cluster/test-usw2-cluster" = "member"
  }
}

module "network" {
  source = "../.."

  availability_zones              = ["us-west-2a"]
  default_security_group_deny_all = true
  environment                     = "test"
  cidr_block                      = "10.0.0.0/16"
  internet_gateway_enabled        = true
  label_create_enabled            = false
  nat_gateway_enabled             = false
  nat_instance_enabled            = false
  private_subnets_additional_tags = local.subnet_tags
  public_subnets_additional_tags  = local.subnet_tags
  region_code                     = "usw2"
  tags                            = local.tags
  vpc_name                        = "test-usw2-vpc"
}
