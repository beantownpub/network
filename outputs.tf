#
# Jalgraves 2021
#

output "public_subnet_cidrs" {
  value       = module.subnets.public_subnet_cidrs
  description = "Public subnet CIDR blocks"
}

output "public_subnet_ids" {
  value       = module.subnets.public_subnet_ids
  description = "Public subnet IDs"
}

output "private_subnet_cidrs" {
  value       = module.subnets.private_subnet_cidrs
  description = "Private subnet CIDR blocks"
}

output "private_subnet_ids" {
  value       = module.subnets.private_subnet_ids
  description = "Private subnet IDs"
}
output "vpc" {
  description = "VPC map"
  value       = module.vpc
}

output "vpc_cidr" {
  value       = module.vpc.vpc_cidr_block
  description = "VPC CIDR block"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "vpc_default_security_group_id" {
  value       = module.vpc.vpc_default_security_group_id
  description = "Default security group ID"
}

output "vpc_main_route_table_id" {
  value       = module.vpc.vpc_main_route_table_id
  description = "The ID of the main route table associated with this VPC"
}

output "vpc_default_route_table_id" {
  value       = module.vpc.vpc_default_route_table_id
  description = "The ID of the route table created by default on VPC creation"
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "network" {
  value = {
    vpc_id                        = module.vpc.vpc_id
    vpc_cidr                      = module.vpc.vpc_cidr_block
    vpc_default_security_group_id = module.vpc.vpc_default_security_group_id
    vpc_default_route_table_id    = module.vpc.vpc_default_route_table_id
    igw_id                        = module.vpc.igw_id
    main_route_table_id           = module.vpc.vpc_main_route_table_id
    nat_ips                       = module.subnets.nat_ips
    private_subnet_ids            = module.subnets.private_subnet_ids
    public_subnet_ids             = module.subnets.public_subnet_ids
  }
}
