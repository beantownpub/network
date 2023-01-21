# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+-+-+
# |*|*|*|*| |J|A|L|G|R|A|V|E|S| |*|*|*|*|
# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+-+-+

output "subnets" {
  value = {
    nat_eip_allocation_ids  = module.subnets.nat_eip_allocation_ids
    nat_gateway_ids         = module.subnets.nat_gateway_ids
    nat_ips                 = module.subnets.nat_ips
    private_route_table_ids = module.subnets.private_route_table_ids
    private_subnet_ids      = module.subnets.private_subnet_ids
    private_subnet_cidrs    = module.subnets.private_subnet_cidrs
    public_route_table_ids  = module.subnets.public_route_table_ids
    public_subnet_ids       = module.subnets.public_subnet_ids
    public_subnet_cidrs     = module.subnets.public_subnet_cidrs
  }
}

output "vpc" {
  value = {
    vpc_id                        = module.vpc.vpc_id
    vpc_cidr                      = module.vpc.vpc_cidr_block
    vpc_default_security_group_id = module.vpc.vpc_default_security_group_id
    vpc_default_route_table_id    = module.vpc.vpc_default_route_table_id
    igw_id                        = module.vpc.igw_id
    main_route_table_id           = module.vpc.vpc_main_route_table_id
  }
}
