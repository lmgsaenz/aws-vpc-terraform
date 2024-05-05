locals {
  len_public_subnets  = length(var.public_subnets)
  len_private_subnets = length(var.private_subnets)

  create_public_subnets  = local.len_public_subnets > 0
  create_private_subnets = local.len_private_subnets > 0
}
#################################################
# VPC
#################################################
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    { "Name" : format("%s-vpc", var.name) },
    var.tags,
    var.vpc_tags
  )
}
#################################################
# Public Subnets
#################################################
resource "aws_subnet" "public" {
  count             = local.create_public_subnets ? local.len_public_subnets : 0
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = element(var.azs, count.index)
  tags = merge(
    { "Name" = try(
      var.public_subnet_names[count.index],
      format("${var.name}-${var.public_subnet_suffix}-%s", regex("[^/-]+$", element(var.azs, count.index)))
      )
    },
    var.tags,
    var.public_subnet_tags
  )
}
resource "aws_route_table" "public" {
  count  = local.create_public_subnets ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = merge(
    { "Name" : "${var.name}-${var.public_subnet_suffix}" },
    var.tags,
    var.public_route_table_tags
  )
}
resource "aws_route_table_association" "public" {
  count          = local.create_public_subnets ? local.len_public_subnets : 0
  route_table_id = aws_route_table.public[0].id
  subnet_id      = element(aws_subnet.public[*].id, count.index)
}
resource "aws_route" "public_internet_gateway" {
  count                  = local.create_public_subnets && var.create_igw ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}
resource "aws_network_acl" "public" {
  count      = local.create_public_subnets ? 1 : 0
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.public[*].id
  tags = merge(
    { "Name" : "${var.name}-${var.public_subnet_suffix}" },
    var.tags,
    var.public_network_acl_tags
  )
}
resource "aws_network_acl_rule" "public_inbound" {
  count          = local.create_public_subnets ? 1 : 0
  network_acl_id = aws_network_acl.public[0].id
  egress         = false
  rule_number    = var.public_inbound_network_acl_rule["rule_number"]
  rule_action    = var.public_inbound_network_acl_rule["rule_action"]
  protocol       = var.public_inbound_network_acl_rule["protocol"]
  from_port      = var.public_inbound_network_acl_rule["from_port"]
  to_port        = var.public_inbound_network_acl_rule["to_port"]
  cidr_block     = var.public_inbound_network_acl_rule["cidr_block"]
}
resource "aws_network_acl_rule" "public_outbound" {
  count          = local.create_public_subnets ? 1 : 0
  network_acl_id = aws_network_acl.public[0].id
  egress         = true
  rule_number    = var.public_outbound_network_acl_rule["rule_number"]
  rule_action    = var.public_outbound_network_acl_rule["rule_action"]
  protocol       = var.public_outbound_network_acl_rule["protocol"]
  from_port      = var.public_outbound_network_acl_rule["from_port"]
  to_port        = var.public_outbound_network_acl_rule["to_port"]
  cidr_block     = var.public_outbound_network_acl_rule["cidr_block"]
}
#################################################
# Private Subnets
#################################################
resource "aws_subnet" "private" {
  count             = local.create_private_subnets ? local.len_private_subnets : 0
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.azs, count.index)
  tags = merge(
    { "Name" = try(
      var.private_subnet_names[count.index],
      format("${var.name}-${var.private_subnet_suffix}-%s", regex("[^/-]+$", element(var.azs, count.index)))
      )
    },
    var.tags,
    var.private_subnet_tags
  )
}
resource "aws_route_table" "private" {
  count  = local.create_private_subnets ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = merge(
    { "Name" : "${var.name}-${var.private_subnet_suffix}" },
    var.tags,
    var.private_route_table_tags
  )
}
resource "aws_route_table_association" "private" {
  count          = local.create_private_subnets ? local.len_private_subnets : 0
  route_table_id = aws_route_table.private[0].id
  subnet_id      = element(aws_subnet.private[*].id, count.index)
}
resource "aws_network_acl" "private" {
  count      = local.create_private_subnets ? 1 : 0
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.private[*].id
  tags = merge(
    { "Name" : "${var.name}-${var.private_subnet_suffix}" },
    var.tags,
    var.private_network_acl_tags
  )
}
resource "aws_network_acl_rule" "private_inbound" {
  count          = local.create_private_subnets ? 1 : 0
  network_acl_id = aws_network_acl.private[0].id
  egress         = false
  rule_number    = var.private_inbound_network_acl_rule["rule_number"]
  rule_action    = var.private_inbound_network_acl_rule["rule_action"]
  protocol       = var.private_inbound_network_acl_rule["protocol"]
  from_port      = var.private_inbound_network_acl_rule["from_port"]
  to_port        = var.private_inbound_network_acl_rule["to_port"]
  cidr_block     = var.private_inbound_network_acl_rule["cidr_block"]
}
resource "aws_network_acl_rule" "private_outbound" {
  count          = local.create_private_subnets ? 1 : 0
  network_acl_id = aws_network_acl.private[0].id
  egress         = true
  rule_number    = var.private_outbound_network_acl_rule["rule_number"]
  rule_action    = var.private_outbound_network_acl_rule["rule_action"]
  protocol       = var.private_outbound_network_acl_rule["protocol"]
  from_port      = var.private_outbound_network_acl_rule["from_port"]
  to_port        = var.private_outbound_network_acl_rule["to_port"]
  cidr_block     = var.private_outbound_network_acl_rule["cidr_block"]
}
#################################################
# Internet Gateway
#################################################
resource "aws_internet_gateway" "this" {
  count  = local.create_public_subnets && var.create_igw ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = merge(
    { "Name" : var.name },
    var.tags,
    var.igw_tags
  )
}
#################################################
# NAT Gateway
#################################################
resource "aws_eip" "nat" {
  count  = local.create_private_subnets && var.enable_nat_gateway ? 1 : 0
  domain = "vpc"
  tags = merge(
    { "Name" : format("${var.name}-%s", regex("[^/-]+$", element(var.azs, count.index))) },
    var.tags,
    var.nat_eip_tags
  )
}
resource "aws_nat_gateway" "this" {
  count         = local.create_private_subnets && var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = element(aws_subnet.public[*].id, count.index)
  tags = merge(
    { "Name" : format("${var.name}-%s", regex("[^/-]+$", element(var.azs, count.index))) },
    var.tags,
    var.nat_gateway_tags
  )
  depends_on = [aws_internet_gateway.this]
}
resource "aws_route" "private_nat_gateway" {
  count                  = local.create_private_subnets && var.enable_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.private[0].id
  nat_gateway_id         = aws_nat_gateway.this[0].id
  destination_cidr_block = var.nat_gateway_destinatino_cidr_block
}
