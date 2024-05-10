# Simple VPC
## Usage
To run this example you need to execute:
```bash
$ terraform init
$ terraform plan
$ terraform apply
````
This example may create resources which can cost money (AWS NAT GATEWAY, for example). Run `terrafrom destroy` when you don't need these resources.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.48 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.48 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_arn"></a> [igw\_arn](#output\_igw\_arn) | The arn of the Internet Gateway |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The id of the Internet Gateway |
| <a name="output_nat_ids"></a> [nat\_ids](#output\_nat\_ids) | A list of allocation ID of Elastic IPs created for AWS NAT Gateway |
| <a name="output_nat_public_ips"></a> [nat\_public\_ips](#output\_nat\_public\_ips) | A list of public Elastic IPs created for AWS NAT Gateway |
| <a name="output_natgw_ids"></a> [natgw\_ids](#output\_natgw\_ids) | List of NAT Gateway IDs |
| <a name="output_natgw_interface_ids"></a> [natgw\_interface\_ids](#output\_natgw\_interface\_ids) | List of Network Interface IDs assigned to NAT Gateways |
| <a name="output_private_inbound_network_acl_rule_id"></a> [private\_inbound\_network\_acl\_rule\_id](#output\_private\_inbound\_network\_acl\_rule\_id) | The ID of the Private Inbound Network ACL Rule |
| <a name="output_private_nat_gateway_route_ids"></a> [private\_nat\_gateway\_route\_ids](#output\_private\_nat\_gateway\_route\_ids) | List of IDs of the Private NAT Gateway route |
| <a name="output_private_network_acl_arn"></a> [private\_network\_acl\_arn](#output\_private\_network\_acl\_arn) | The ARN of the Private Network ACL |
| <a name="output_private_network_acl_id"></a> [private\_network\_acl\_id](#output\_private\_network\_acl\_id) | List of ID of the Private Network ACL |
| <a name="output_private_outbound_network_acl_rule_id"></a> [private\_outbound\_network\_acl\_rule\_id](#output\_private\_outbound\_network\_acl\_rule\_id) | The ID of the Private Outbound Network ACL Rule |
| <a name="output_private_route_table_arn"></a> [private\_route\_table\_arn](#output\_private\_route\_table\_arn) | List of ARN of the Private Route Table |
| <a name="output_private_route_table_association_id"></a> [private\_route\_table\_association\_id](#output\_private\_route\_table\_association\_id) | List of ID of the Private Route Table Association |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | List of ID of the Private Route Table |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | A list of ARNs of private subnets |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | A list of IDs of private subnets |
| <a name="output_public_inbound_network_acl_rule_id"></a> [public\_inbound\_network\_acl\_rule\_id](#output\_public\_inbound\_network\_acl\_rule\_id) | The ID of the Public Inbound Network ACL Rule |
| <a name="output_public_internet_gateway_route_ids"></a> [public\_internet\_gateway\_route\_ids](#output\_public\_internet\_gateway\_route\_ids) | List of IDs of the Public Internet Gateway Rout |
| <a name="output_public_network_acl_arn"></a> [public\_network\_acl\_arn](#output\_public\_network\_acl\_arn) | The ARN of the Public Network ACL |
| <a name="output_public_network_acl_id"></a> [public\_network\_acl\_id](#output\_public\_network\_acl\_id) | The ID of the Public Network ACL |
| <a name="output_public_outbound_network_acl_rule_id"></a> [public\_outbound\_network\_acl\_rule\_id](#output\_public\_outbound\_network\_acl\_rule\_id) | The ID of the Public Outbound Network ACL Rule |
| <a name="output_public_route_table_arns"></a> [public\_route\_table\_arns](#output\_public\_route\_table\_arns) | List of ARNs of the Public Route Table |
| <a name="output_public_route_table_association_ids"></a> [public\_route\_table\_association\_ids](#output\_public\_route\_table\_association\_ids) | List of ID of the Public Route Table Association |
| <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids) | List of IDs of the Public Route Table |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | A list of ARNs of public subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | A list of IDs of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR Block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
