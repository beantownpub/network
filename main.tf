#                   ___                         ___           ___           ___                         ___           ___
#      ___         /\  \                       /\__\         /\  \         /\  \          ___          /\__\         /\__\
#     /\__\       /::\  \                     /:/ _/_       /::\  \       /::\  \        /\  \        /:/ _/_       /:/ _/_
#    /:/__/      /:/\:\  \                   /:/ /\  \     /:/\:\__\     /:/\:\  \       \:\  \      /:/ /\__\     /:/ /\  \
#   /::\  \     /:/ /::\  \   ___     ___   /:/ /::\  \   /:/ /:/  /    /:/ /::\  \       \:\  \    /:/ /:/ _/_   /:/ /::\  \
#   \/\:\  \   /:/_/:/\:\__\ /\  \   /\__\ /:/__\/\:\__\ /:/_/:/__/___ /:/_/:/\:\__\  ___  \:\__\  /:/_/:/ /\__\ /:/_/:/\:\__\
#    ~~\:\  \  \:\/:/  \/__/ \:\  \ /:/  / \:\  \ /:/  / \:\/:::::/  / \:\/:/  \/__/ /\  \ |:|  |  \:\/:/ /:/  / \:\/:/ /:/  /
#       \:\__\  \::/__/       \:\  /:/  /   \:\  /:/  /   \::/~~/~~~~   \::/__/      \:\  \|:|  |   \::/_/:/  /   \::/ /:/  /
#       /:/  /   \:\  \        \:\/:/  /     \:\/:/  /     \:\~~\        \:\  \       \:\__|:|__|    \:\/:/  /     \/_/:/  /
#      /:/  /     \:\__\        \::/  /       \::/  /       \:\__\        \:\__\       \::::/__/      \::/  /        /:/  /
#      \/__/       \/__/         \/__/         \/__/         \/__/         \/__/        ~~~~           \/__/         \/__/

data "aws_region" "current" {}

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
  stage                                     = var.region_code
  tags                                      = var.tags
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
  stage                   = var.region_code
  tags                    = var.tags
}
