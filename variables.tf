#
# Jalgraves 2021
#

variable "additional_cidr_blocks" {
  description = "A list of additional IPv4 CIDR blocks to associate with the VPC"
  type        = list(string)
  default     = null
}

variable "allow_ssh_from_ip" {
  type        = string
  description = "IP to allow SSH access from"
  default     = null
}

variable "availability_zones" {
  description = "A list of AZs for where subnets will be created"
  type        = list(string)
}

variable "cidr_block" {
  description = "CIDR for the VPC"
  type        = string
}

variable "classiclink_enabled" {
  description = "A boolean flag to enable/disable ClassicLink for the VPC"
  type        = bool
  default     = false
}

variable "classiclink_dns_support_enabled" {
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC"
  type        = bool
  default     = false
}

variable "create_ssh_sg" {
  type        = bool
  description = "Create security group to allow SSH"
  default     = false
}

variable "dns_hostnames_enabled" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "dns_support_enabled" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "default_security_group_deny_all" {
  type        = bool
  description = <<EOT
    When true, manage the default security group and remove all rules, disabling all ingress and egress.
    When false, do not manage the default security group, allowing it to be managed by another component
    EOT
  default     = false
}

variable "environment" {
  type        = string
  description = ""
  default     = null
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "internet_gateway_enabled" {
  type        = bool
  description = ""
  default     = true
}

variable "ipv6_egress_only_internet_gateway_enabled" {
  type        = string
  description = "A boolean flag to enable/disable IPv6 Egress-Only Internet Gateway creation"
  default     = false
}

variable "ipv6_enabled" {
  description = "Whether to assign generated ipv6 cidr block to the VPC"
  type        = bool
  default     = false
}

variable "label_create_enabled" {
  type        = bool
  description = "Whether or not to create custom labels"
  default     = false
}

variable "labels_as_tags" {
  type        = list(string)
  description = ""
  default     = ["environment", "name", "attributes"]
}

variable "label_order" {
  type        = list(string)
  description = ""
  default     = ["namespace", "environment", "stage", "name", "attributes"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Instances launched into a public subnet should be assigned a public IP address"
  default     = true
}

variable "name" {
  type        = string
  description = ""
  default     = null
}

variable "nat_elastic_ips" {
  type        = list(string)
  description = "Existing Elastic IPs to attach to the NAT Gateway(s) or Instance(s) instead of creating new ones."
  default     = []
}

variable "nat_gateway_enabled" {
  type        = bool
  description = "Flag to enable/disable NAT Gateways to allow servers in the private subnets to access the Internet"
  default     = false
}

variable "nat_instance_enabled" {
  type        = bool
  description = "Flag to enable/disable NAT Instances to allow servers in the private subnets to access the Internet"
  default     = false
}

variable "nat_instance_type" {
  type        = string
  description = "NAT Instance type"
  default     = "t3.micro"
}

variable "private_network_acl_id" {
  type        = string
  description = "Network ACL ID that will be added to private subnets. If empty, a new ACL will be created"
  default     = ""
}

variable "private_subnets_additional_tags" {
  default = {}
}

variable "public_network_acl_id" {
  type        = string
  description = "Network ACL ID that will be added to public subnets. If empty, a new ACL will be created"
  default     = ""
}
variable "public_subnets_additional_tags" {
  default = {}
}

variable "region_code" {
  type        = string
  description = ""
  default     = null
}

variable "subnet_attributes" {
  type        = list(string)
  description = <<EOT
    ID element. Additional attributes (e.g. workers or cluster) to add to id, in the order they appear in the list. New attributes are appended to the
    end of the list. The elements of the list are joined by the delimiter and treated as a single ID element
    EOT
  default     = ["subnet"]
}

variable "tags" {
  type        = map(string)
  description = ""
  default     = {}
}

variable "vpc_attributes" {
  type        = list(string)
  description = <<EOT
    ID element. Additional attributes (e.g. workers or cluster) to add to id, in the order they appear in the list. New attributes are appended to the
    end of the list. The elements of the list are joined by the delimiter and treated as a single ID element
    EOT
  default     = ["vpc"]
}
