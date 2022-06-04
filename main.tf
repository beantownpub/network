# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+-+-+
# |*|*|*|*| |J|A|L|G|R|A|V|E|S| |*|*|*|*|
# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+-+-+
# 2022

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
  tags                                      = merge(var.tags, { "Name" = var.vpc_name })
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.0.2"

  attributes                      = var.subnet_attributes
  availability_zones              = var.availability_zones
  ipv4_cidr_block                 = [module.vpc.vpc_cidr_block]
  environment                     = var.environment
  igw_id                          = [module.vpc.igw_id]
  labels_as_tags                  = var.labels_as_tags
  label_order                     = var.label_order
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  max_nats                        = var.max_nats
  nat_elastic_ips                 = var.nat_elastic_ips
  nat_gateway_enabled             = var.nat_gateway_enabled
  nat_instance_enabled            = var.nat_instance_enabled
  nat_instance_type               = var.nat_instance_type
  private_subnets_additional_tags = var.private_subnets_additional_tags
  public_subnets_additional_tags  = var.public_subnets_additional_tags
  vpc_id                          = module.vpc.vpc_id
  stage                           = var.region_code
  tags                            = var.tags
}
