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


resource "aws_security_group" "allow_ssh" {
  count       = var.enabled ? 1 : 0
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.ssh_ip
  }

  ingress {
    description = "Allow K8s API access from my IP"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = local.ssh_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}
