#################################################
# VPC
#################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}
output "vpc_cidr_block" {
  description = "The CIDR Block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
#################################################
# Public Subnets
#################################################
output "public_subnet_ids" {
  description = "A list of IDs of public subnets"
  value       = module.vpc.public_subnet_ids
}
output "public_subnet_arns" {
  description = "A list of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}
output "public_route_table_id" {
  description = "The ID of the Public Route Table"
  value       = module.vpc.public_route_table_id
}
output "public_route_table_arn" {
  description = "The ARN of the Public Route Table"
  value       = module.vpc.public_route_table_arn
}
output "public_route_table_association_id" {
  description = "List of ID of the Public Route Table Association"
  value       = module.vpc.public_route_table_association_id
}
output "public_internet_gateway_route_id" {
  description = "The ID of the Public Internet Gateway Rout"
  value       = module.vpc.public_internet_gateway_route_id
}
output "public_network_acl_id" {
  description = "The ID of the Public Network ACL"
  value       = module.vpc.public_network_acl_id
}
output "public_network_acl_arn" {
  description = "The ARN of the Public Network ACL"
  value       = module.vpc.public_network_acl_arn
}
output "public_inbound_network_acl_rule_id" {
  description = "The ID of the Public Inbound Network ACL Rule"
  value       = module.vpc.public_inbound_network_acl_rule_id
}
output "public_outbound_network_acl_rule_id" {
  description = "The ID of the Public Outbound Network ACL Rule"
  value       = module.vpc.public_outbound_network_acl_rule_id
}
#################################################
# Private Subnets
#################################################
output "private_subnet_ids" {
  description = "A list of IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}
output "private_subnet_arns" {
  description = "A list of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}
output "private_route_table_id" {
  description = "List of ID of the Private Route Table"
  value       = module.vpc.private_route_table_id
}
output "private_route_table_arn" {
  description = "List of ARN of the Private Route Table"
  value       = module.vpc.private_route_table_arn
}
output "private_nat_gateway_route_ids" {
  description = "List of IDs of the Private NAT Gateway route"
  value       = module.vpc.private_nat_gateway_route_ids
}
output "private_route_table_association_id" {
  description = "List of ID of the Private Route Table Association"
  value       = module.vpc.private_route_table_association_id
}
output "private_network_acl_id" {
  description = "List of ID of the Private Network ACL"
  value       = module.vpc.private_network_acl_id
}
output "private_network_acl_arn" {
  description = "The ARN of the Private Network ACL"
  value       = module.vpc.private_network_acl_arn
}
output "private_inbound_network_acl_rule_id" {
  description = "The ID of the Private Inbound Network ACL Rule"
  value       = module.vpc.private_inbound_network_acl_rule_id
}
output "private_outbound_network_acl_rule_id" {
  description = "The ID of the Private Outbound Network ACL Rule"
  value       = module.vpc.private_outbound_network_acl_rule_id
}
#################################################
# Internet Gateway
#################################################
output "igw_id" {
  description = "The id of the Internet Gateway"
  value       = module.vpc.igw_id
}
output "igw_arn" {
  description = "The arn of the Internet Gateway"
  value       = module.vpc.igw_arn
}
#################################################
# NAT Gateway
#################################################
output "nat_ids" {
  description = "A list of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_ids
}
output "nat_public_ips" {
  description = "A list of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}
output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.natgw_ids
}
output "natgw_interface_ids" {
  description = "List of Network Interface IDs assigned to NAT Gateways"
  value       = module.vpc.natgw_interface_ids
}
