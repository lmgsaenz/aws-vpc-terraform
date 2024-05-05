# aws-vpc-terraform
## Usage
```bash
module "vpc" {
  source          = "../.."
  name            = "vpc"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  cidr_block      = "10.0.0.0/16"
  public_subnets  = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  private_subnets = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]
  tags            = {
    Terraform = "true"
    Environment = "dev"
  }
}
```
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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_network_acl.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.private_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.private_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | A list of availabily zones or ids in the region | `list(string)` | `[]` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The IPv4 CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | Control if you want to create an Internet Gateway for public subnets and the configuration of the routes to connect | `bool` | `true` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | `false` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | A boolean flag to enable/disable DNS support in the VPC. | `bool` | `true` | no |
| <a name="input_igw_tags"></a> [igw\_tags](#input\_igw\_tags) | Additional tags for the Internet Gateway | `map(string)` | `{}` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all resources as identifier | `string` | `""` | no |
| <a name="input_private_inbound_network_acl_rule"></a> [private\_inbound\_network\_acl\_rule](#input\_private\_inbound\_network\_acl\_rule) | value | `map(string)` | <pre>{<br>  "cidr_block": "0.0.0.0/0",<br>  "from_port": 0,<br>  "protocol": "-1",<br>  "rule_action": "allow",<br>  "rule_number": "100",<br>  "to_port": 0<br>}</pre> | no |
| <a name="input_private_network_acl_tags"></a> [private\_network\_acl\_tags](#input\_private\_network\_acl\_tags) | Additional tags for the Private Network ACL | `map(string)` | `{}` | no |
| <a name="input_private_outbound_network_acl_rule"></a> [private\_outbound\_network\_acl\_rule](#input\_private\_outbound\_network\_acl\_rule) | value | `map(string)` | <pre>{<br>  "cidr_block": "0.0.0.0/0",<br>  "from_port": 0,<br>  "protocol": "-1",<br>  "rule_action": "allow",<br>  "rule_number": "100",<br>  "to_port": 0<br>}</pre> | no |
| <a name="input_private_route_table_tags"></a> [private\_route\_table\_tags](#input\_private\_route\_table\_tags) | Additional tags for the Private Route Table | `map(string)` | `{}` | no |
| <a name="input_private_subnet_names"></a> [private\_subnet\_names](#input\_private\_subnet\_names) | Explicit subnet names to use in the Name tag on private subnets. If empty, Name tags are generated automatically | `list(string)` | `[]` | no |
| <a name="input_private_subnet_suffix"></a> [private\_subnet\_suffix](#input\_private\_subnet\_suffix) | Suffix to append to private subnets names | `string` | `"private"` | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | Additional tags for the Private Subnets | `map(string)` | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of private subnets inside the vpc | `list(string)` | `[]` | no |
| <a name="input_public_inbound_network_acl_rule"></a> [public\_inbound\_network\_acl\_rule](#input\_public\_inbound\_network\_acl\_rule) | value | `map(string)` | <pre>{<br>  "cidr_block": "0.0.0.0/0",<br>  "from_port": 0,<br>  "protocol": "-1",<br>  "rule_action": "allow",<br>  "rule_number": "100",<br>  "to_port": 0<br>}</pre> | no |
| <a name="input_public_network_acl_tags"></a> [public\_network\_acl\_tags](#input\_public\_network\_acl\_tags) | Additional tags for the Public Network ACL | `map(string)` | `{}` | no |
| <a name="input_public_outbound_network_acl_rule"></a> [public\_outbound\_network\_acl\_rule](#input\_public\_outbound\_network\_acl\_rule) | value | `map(string)` | <pre>{<br>  "cidr_block": "0.0.0.0/0",<br>  "from_port": 0,<br>  "protocol": "-1",<br>  "rule_action": "allow",<br>  "rule_number": "100",<br>  "to_port": 0<br>}</pre> | no |
| <a name="input_public_route_table_tags"></a> [public\_route\_table\_tags](#input\_public\_route\_table\_tags) | Additional tags for the Public Route Table | `map(string)` | `{}` | no |
| <a name="input_public_subnet_names"></a> [public\_subnet\_names](#input\_public\_subnet\_names) | Explicit subnet names to use in the Name tag on public subnets. If empty, Name tags are generated automatically | `list(string)` | `[]` | no |
| <a name="input_public_subnet_suffix"></a> [public\_subnet\_suffix](#input\_public\_subnet\_suffix) | Suffix to append to public subnets names | `string` | `"public"` | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Additional tags for the Public Subnets | `map(string)` | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of public subnets inside the vpc | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | Additional tags for the VPC | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_arn"></a> [igw\_arn](#output\_igw\_arn) | The arn of the Internet Gateway |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The id of the Internet Gateway |
| <a name="output_private_inbound_network_acl_rule_id"></a> [private\_inbound\_network\_acl\_rule\_id](#output\_private\_inbound\_network\_acl\_rule\_id) | The ID of the Private Inbound Network ACL Rule |
| <a name="output_private_network_acl_arn"></a> [private\_network\_acl\_arn](#output\_private\_network\_acl\_arn) | The ARN of the Private Network ACL |
| <a name="output_private_network_acl_id"></a> [private\_network\_acl\_id](#output\_private\_network\_acl\_id) | The ID of the Private Network ACL |
| <a name="output_private_outbound_network_acl_rule_id"></a> [private\_outbound\_network\_acl\_rule\_id](#output\_private\_outbound\_network\_acl\_rule\_id) | The ID of the Private Outbound Network ACL Rule |
| <a name="output_private_route_table_arn"></a> [private\_route\_table\_arn](#output\_private\_route\_table\_arn) | The ARN of the Private Route Table |
| <a name="output_private_route_table_association_id"></a> [private\_route\_table\_association\_id](#output\_private\_route\_table\_association\_id) | The ID of the PubPrivatelic Route Table Association |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | The ID of the Private Route Table |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | A list of ARNs of private subnets |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | A list of IDs of private subnets |
| <a name="output_public_inbound_network_acl_rule_id"></a> [public\_inbound\_network\_acl\_rule\_id](#output\_public\_inbound\_network\_acl\_rule\_id) | The ID of the Public Inbound Network ACL Rule |
| <a name="output_public_internet_gateway_route_id"></a> [public\_internet\_gateway\_route\_id](#output\_public\_internet\_gateway\_route\_id) | The ID of the Public Internet Gateway Rout |
| <a name="output_public_network_acl_arn"></a> [public\_network\_acl\_arn](#output\_public\_network\_acl\_arn) | The ARN of the Public Network ACL |
| <a name="output_public_network_acl_id"></a> [public\_network\_acl\_id](#output\_public\_network\_acl\_id) | The ID of the Public Network ACL |
| <a name="output_public_outbound_network_acl_rule_id"></a> [public\_outbound\_network\_acl\_rule\_id](#output\_public\_outbound\_network\_acl\_rule\_id) | The ID of the Public Outbound Network ACL Rule |
| <a name="output_public_route_table_arn"></a> [public\_route\_table\_arn](#output\_public\_route\_table\_arn) | The ARN of the Public Route Table |
| <a name="output_public_route_table_association_id"></a> [public\_route\_table\_association\_id](#output\_public\_route\_table\_association\_id) | The ID of the Public Route Table Association |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | The ID of the Public Route Table |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | A list of ARNs of public subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | A list of IDs of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR Block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
