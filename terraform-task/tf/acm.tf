# /* Get Zone ID before issuing Certificate */
# data "aws_route53_zone" "Zone_ID" {
#   name = var.domain_name
# }

# module "acm" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 4.0"

#   domain_name = var.domain_name
#   zone_id     = data.aws_route53_zone.Zone_ID.zone_id

#   subject_alternative_names = [
#     "${var.domain_name}",
#     "*.${var.domain_name}",
#   ]

#   wait_for_validation = true

#   tags = {
#     Name = var.domain_name
#   }
# }