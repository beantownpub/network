# terraform-aws-network

Terraform module for setting up AWS networking

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnets"></a> [subnets](#module\_subnets) | cloudposse/dynamic-subnets/aws | 2.0.4 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | cloudposse/vpc/aws | 2.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_cidr_blocks"></a> [additional\_cidr\_blocks](#input\_additional\_cidr\_blocks) | A list of additional IPv4 CIDR blocks to associate with the VPC | `list(string)` | `null` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | A list of AZs for where subnets will be created | `list(string)` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR for the VPC | `string` | n/a | yes |
| <a name="input_classiclink_dns_support_enabled"></a> [classiclink\_dns\_support\_enabled](#input\_classiclink\_dns\_support\_enabled) | A boolean flag to enable/disable ClassicLink DNS Support for the VPC | `bool` | `false` | no |
| <a name="input_classiclink_enabled"></a> [classiclink\_enabled](#input\_classiclink\_enabled) | A boolean flag to enable/disable ClassicLink for the VPC | `bool` | `false` | no |
| <a name="input_default_security_group_deny_all"></a> [default\_security\_group\_deny\_all](#input\_default\_security\_group\_deny\_all) | When true, manage the default security group and remove all rules, disabling all ingress and egress.<br>    When false, do not manage the default security group, allowing it to be managed by another component | `bool` | `false` | no |
| <a name="input_dns_hostnames_enabled"></a> [dns\_hostnames\_enabled](#input\_dns\_hostnames\_enabled) | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_dns_support_enabled"></a> [dns\_support\_enabled](#input\_dns\_support\_enabled) | A boolean flag to enable/disable DNS support in the VPC | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `null` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| <a name="input_internet_gateway_enabled"></a> [internet\_gateway\_enabled](#input\_internet\_gateway\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_ipv6_egress_only_internet_gateway_enabled"></a> [ipv6\_egress\_only\_internet\_gateway\_enabled](#input\_ipv6\_egress\_only\_internet\_gateway\_enabled) | A boolean flag to enable/disable IPv6 Egress-Only Internet Gateway creation | `string` | `false` | no |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Whether to assign generated ipv6 cidr block to the VPC | `bool` | `false` | no |
| <a name="input_label_create_enabled"></a> [label\_create\_enabled](#input\_label\_create\_enabled) | Whether or not to create custom labels | `bool` | `false` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | n/a | `list(string)` | <pre>[<br>  "namespace",<br>  "environment",<br>  "stage",<br>  "name",<br>  "attributes"<br>]</pre> | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | n/a | `list(string)` | `[]` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Instances launched into a public subnet should be assigned a public IP address | `bool` | `true` | no |
| <a name="input_max_nats"></a> [max\_nats](#input\_max\_nats) | n/a | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `null` | no |
| <a name="input_nat_elastic_ips"></a> [nat\_elastic\_ips](#input\_nat\_elastic\_ips) | Existing Elastic IPs to attach to the NAT Gateway(s) or Instance(s) instead of creating new ones. | `list(string)` | `[]` | no |
| <a name="input_nat_gateway_enabled"></a> [nat\_gateway\_enabled](#input\_nat\_gateway\_enabled) | Flag to enable/disable NAT Gateways to allow servers in the private subnets to access the Internet | `bool` | `true` | no |
| <a name="input_nat_instance_enabled"></a> [nat\_instance\_enabled](#input\_nat\_instance\_enabled) | Flag to enable/disable NAT Instances to allow servers in the private subnets to access the Internet | `bool` | `false` | no |
| <a name="input_nat_instance_type"></a> [nat\_instance\_type](#input\_nat\_instance\_type) | NAT Instance type | `string` | `"t3.micro"` | no |
| <a name="input_private_subnets_additional_tags"></a> [private\_subnets\_additional\_tags](#input\_private\_subnets\_additional\_tags) | n/a | `map` | `{}` | no |
| <a name="input_public_subnets_additional_tags"></a> [public\_subnets\_additional\_tags](#input\_public\_subnets\_additional\_tags) | n/a | `map` | `{}` | no |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | n/a | `string` | `null` | no |
| <a name="input_subnet_attributes"></a> [subnet\_attributes](#input\_subnet\_attributes) | ID element. Additional attributes (e.g. workers or cluster) to add to id, in the order they appear in the list. New attributes are appended to the<br>    end of the list. The elements of the list are joined by the delimiter and treated as a single ID element | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vpc_attributes"></a> [vpc\_attributes](#input\_vpc\_attributes) | ID element. Additional attributes (e.g. workers or cluster) to add to id, in the order they appear in the list. New attributes are appended to the<br>    end of the list. The elements of the list are joined by the delimiter and treated as a single ID element | `list(string)` | <pre>[<br>  "vpc"<br>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END_TF_DOCS -->
