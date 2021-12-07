#
# Jalgraves 2021
#

data "aws_region" "current" {}

module "labels" {
  source  = "app.terraform.io/beantown/labels/aws"
  version = "0.1.1"

  enabled     = var.label_create_enabled
  environment = var.environment
  region      = data.aws_region.current.name
}

locals {
  region_code         = var.label_create_enabled ? module.labels.labels.region_code : null
  security_group_name = var.label_create_enabled ? "${var.environment}-${local.region_code}-sg" : "${var.environment}-sg"
  tags = var.label_create_enabled ? {
    "last-revision" = module.labels.labels.date
  } : {}
}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "0.28.1"

  attributes                                = concat(["vpc"], var.vpc_attributes)
  cidr_block                                = var.cidr_block
  classiclink_dns_support_enabled           = var.classiclink_dns_support_enabled
  classiclink_enabled                       = var.classiclink_enabled
  default_security_group_deny_all           = var.default_security_group_deny_all
  dns_hostnames_enabled                     = var.dns_hostnames_enabled
  dns_support_enabled                       = var.dns_support_enabled
  environment                               = var.environment
  instance_tenancy                          = var.instance_tenancy
  internet_gateway_enabled                  = var.internet_gateway_enabled
  ipv6_egress_only_internet_gateway_enabled = var.ipv6_egress_only_internet_gateway_enabled
  ipv6_enabled                              = var.ipv6_enabled
  labels_as_tags                            = var.labels_as_tags
  label_order                               = var.label_order
  stage                                     = local.region_code
  tags                                      = merge(var.tags, local.tags)
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "0.39.8"

  attributes              = var.subnet_attributes
  availability_zones      = var.availability_zones
  cidr_block              = module.vpc.vpc_cidr_block
  environment             = var.environment
  igw_id                  = module.vpc.igw_id
  labels_as_tags          = var.labels_as_tags
  label_order             = var.label_order
  map_public_ip_on_launch = var.map_public_ip_on_launch
  nat_elastic_ips         = var.nat_elastic_ips
  nat_gateway_enabled     = var.nat_gateway_enabled
  nat_instance_enabled    = var.nat_instance_enabled
  nat_instance_type       = var.nat_instance_type
  private_network_acl_id  = var.private_network_acl_id
  public_network_acl_id   = var.public_network_acl_id
  vpc_id                  = module.vpc.vpc_id
  stage                   = local.region_code
  tags                    = merge(var.tags, local.tags)
}


module "security_group" {
  source = "./modules/security"

  enabled = var.create_ssh_sg
  name    = local.security_group_name
  ssh_ip  = var.allow_ssh_from_ip
  vpc_id  = module.vpc.vpc_id
}