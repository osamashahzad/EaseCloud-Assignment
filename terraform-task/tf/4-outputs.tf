/*
// VPC outputs
*/

output "vpc" {
  value = {
    id  = module.vpc.vpc_id
    arn = module.vpc.vpc_arn
    private_subnets = {
      ids  = module.vpc.private_subnets
      arns = module.vpc.private_subnet_arns
    }
    public_subnets = {
      ids  = module.vpc.public_subnets
      arns = module.vpc.public_subnet_arns
    }
    natgw_ip = module.vpc.nat_public_ips

  }
}

# output "hostedZone_ID" {
#   value = {
#     id = data.aws_route53_zone.Zone_ID.zone_id
#   }
# }