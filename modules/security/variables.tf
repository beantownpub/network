#
# Jalgraves 2021
#

locals {
  ssh_ip = var.ssh_ip == null ? [] : ["${var.ssh_ip}/32"]
}

variable "description" {
  type        = string
  description = "Description for security group"
  default     = "Allow SSH. Created via Terraform"
}

variable "enabled" {
  type        = bool
  description = "Whether or not to create security group"
  default     = true
}

variable "name" {
  type        = string
  description = "Name of security group"
}

variable "ssh_ip" {
  type        = string
  description = "IP address to allow SSH from"
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where security group is created"
}
