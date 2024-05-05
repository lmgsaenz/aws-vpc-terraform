#################################################
# Global
#################################################
variable "name" {
  description = "Name to be used on all resources as identifier"
  type        = string
  default     = ""
}
variable "azs" {
  description = "A list of availabily zones or ids in the region"
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
#################################################
# VPC
#################################################
variable "cidr_block" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "instance_tenancy" {
  description = "tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}
variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = false
}
variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}
#################################################
# Public Subnets
#################################################
variable "public_subnets" {
  description = "A list of public subnets inside the vpc"
  type        = list(string)
  default     = []
}
variable "public_subnet_names" {
  description = "Explicit subnet names to use in the Name tag on public subnets. If empty, Name tags are generated automatically"
  type        = list(string)
  default     = []
}
variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets names"
  type        = string
  default     = "public"
}
variable "public_subnet_tags" {
  description = "Additional tags for the Public Subnets"
  type        = map(string)
  default     = {}
}
variable "public_route_table_tags" {
  description = "Additional tags for the Public Route Table"
  type        = map(string)
  default     = {}
}
variable "public_network_acl_tags" {
  description = "Additional tags for the Public Network ACL"
  type        = map(string)
  default     = {}
}
variable "public_inbound_network_acl_rule" {
  description = "value"
  type        = map(string)
  default = {
    "rule_number" = "100"
    "rule_action" = "allow"
    "protocol"    = "-1"
    "from_port"   = 0
    "to_port"     = 0
    "cidr_block"  = "0.0.0.0/0"
  }
}
variable "public_outbound_network_acl_rule" {
  description = "value"
  type        = map(string)
  default = {
    "rule_number" = "100"
    "rule_action" = "allow"
    "protocol"    = "-1"
    "from_port"   = 0
    "to_port"     = 0
    "cidr_block"  = "0.0.0.0/0"
  }
}
#################################################
# Private Subnets
#################################################
variable "private_subnets" {
  description = "A list of private subnets inside the vpc"
  type        = list(string)
  default     = []
}
variable "private_subnet_names" {
  description = "Explicit subnet names to use in the Name tag on private subnets. If empty, Name tags are generated automatically"
  type        = list(string)
  default     = []
}
variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets names"
  type        = string
  default     = "private"
}
variable "private_subnet_tags" {
  description = "Additional tags for the Private Subnets"
  type        = map(string)
  default     = {}
}
variable "private_route_table_tags" {
  description = "Additional tags for the Private Route Table"
  type        = map(string)
  default     = {}
}
variable "private_network_acl_tags" {
  description = "Additional tags for the Private Network ACL"
  type        = map(string)
  default     = {}
}
variable "private_inbound_network_acl_rule" {
  description = "value"
  type        = map(string)
  default = {
    "rule_number" = "100"
    "rule_action" = "allow"
    "protocol"    = "-1"
    "from_port"   = 0
    "to_port"     = 0
    "cidr_block"  = "0.0.0.0/0"
  }
}
variable "private_outbound_network_acl_rule" {
  description = "value"
  type        = map(string)
  default = {
    "rule_number" = "100"
    "rule_action" = "allow"
    "protocol"    = "-1"
    "from_port"   = 0
    "to_port"     = 0
    "cidr_block"  = "0.0.0.0/0"
  }
}
#################################################
# Internet Gateway
#################################################
variable "create_igw" {
  description = "Control if you want to create an Internet Gateway for public subnets and the configuration of the routes to connect"
  type        = bool
  default     = true

}
variable "igw_tags" {
  description = "Additional tags for the Internet Gateway"
  type        = map(string)
  default     = {}
}
