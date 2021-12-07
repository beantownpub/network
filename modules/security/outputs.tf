#
# Jalgraves 2021
#

output "security" {
  description = ""
  #value       = var.enabled ? aws_security_group.allow_ssh[0] : {}
  value = one(aws_security_group.allow_ssh[*])
}
