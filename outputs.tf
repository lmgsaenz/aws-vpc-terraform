#################################################
# VPC
#################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.this.arn
}
output "vpc_cidr_block" {
  description = "The CIDR Block of the VPC"
  value       = aws_vpc.this.cidr_block
}
#################################################
# Public Subnets
#################################################
output "public_subnet_ids" {
  description = "A list of IDs of public subnets"
  value       = aws_subnet.public[*].id
}
output "public_subnet_arns" {
  description = "A list of ARNs of public subnets"
  value       = aws_subnet.public[*].arn
}
output "public_route_table_id" {
  description = "The ID of the Public Route Table"
  value       = aws_route_table.public[0].id
}
output "public_route_table_arn" {
  description = "The ARN of the Public Route Table"
  value       = aws_route_table.public[0].arn
}
output "public_route_table_association_id" {
  description = "The ID of the Public Route Table Association"
  value       = aws_route_table_association.public[0].id
}
output "public_internet_gateway_route_id" {
  description = "The ID of the Public Internet Gateway Rout"
  value       = aws_route.public_internet_gateway[0].id
}
output "public_network_acl_id" {
  description = "The ID of the Public Network ACL"
  value       = aws_network_acl.public[0].id
}
output "public_network_acl_arn" {
  description = "The ARN of the Public Network ACL"
  value       = aws_network_acl.public[0].arn
}
output "public_inbound_network_acl_rule_id" {
  description = "The ID of the Public Inbound Network ACL Rule"
  value       = aws_network_acl_rule.public_inbound[0].id
}
output "public_outbound_network_acl_rule_id" {
  description = "The ID of the Public Outbound Network ACL Rule"
  value       = aws_network_acl_rule.public_outbound[0].id
}
#################################################
# Private Subnets
#################################################
output "private_subnet_ids" {
  description = "A list of IDs of private subnets"
  value       = aws_subnet.private[*].id
}
output "private_subnet_arns" {
  description = "A list of ARNs of private subnets"
  value       = aws_subnet.private[*].arn
}
output "private_route_table_id" {
  description = "The ID of the Private Route Table"
  value       = aws_route_table.private[0].id
}
output "private_route_table_arn" {
  description = "The ARN of the Private Route Table"
  value       = aws_route_table.private[0].arn
}
output "private_route_table_association_id" {
  description = "The ID of the PubPrivatelic Route Table Association"
  value       = aws_route_table_association.private[0].id
}
output "private_network_acl_id" {
  description = "The ID of the Private Network ACL"
  value       = aws_network_acl.private[0].id
}
output "private_network_acl_arn" {
  description = "The ARN of the Private Network ACL"
  value       = aws_network_acl.private[0].arn
}
output "private_inbound_network_acl_rule_id" {
  description = "The ID of the Private Inbound Network ACL Rule"
  value       = aws_network_acl_rule.private_inbound[0].id
}
output "private_outbound_network_acl_rule_id" {
  description = "The ID of the Private Outbound Network ACL Rule"
  value       = aws_network_acl_rule.private_outbound[0].id
}
#################################################
# Internet Gateway
#################################################
output "igw_id" {
  description = "The id of the Internet Gateway"
  value       = aws_internet_gateway.this[0].id
}
output "igw_arn" {
  description = "The arn of the Internet Gateway"
  value       = aws_internet_gateway.this[0].arn
}
#################################################
# NAT Gateway
#################################################
output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = try(aws_eip.nat[0].id, null)
}
output "nat_public_ids" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = try(aws_eip.nat[0].public_ip, null)
}
output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = try(aws_nat_gateway.this[0].id, null)
}
output "natgw_interface_ids" {
  description = "List of Network Interface IDs assigned to NAT Gateways"
  value       = try(aws_nat_gateway.this[0].network_interface_id, null)
}
