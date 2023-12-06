#
# https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/v2.55.0
#

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v5.1.0"

  name             = var.vpc_name
  cidr             = var.vpc_cidr
  azs              = var.vpc_azs
  private_subnets  = var.vpc_private_cidrs
  public_subnets   = var.vpc_public_cidrs
  database_subnets = var.vpc_database_cidrs

  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_igw = true

  #tags = local.tags     

}