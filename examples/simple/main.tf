provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name     = "ex-${basename(path.cwd)}"
  vpc_cidr = "10.0.0.0/16"
  region   = "eu-west-1"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  tags = {
    Environment = "Development"
  }
}
module "vpc" {
  source          = "../.."
  name            = local.name
  azs             = local.azs
  cidr_block      = local.vpc_cidr
  public_subnets  = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  private_subnets = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]
  tags            = local.tags
}
