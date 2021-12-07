#
# Jalgraves 2021
#

output "labels" {
  description = ""
  value       = module.network.labels
}

output "security" {
  description = "Output from security group resource"
  value       = module.network.security_group
}

output "network" {
  description = "Output from VPC and subnets"
  value       = module.network.network
}
