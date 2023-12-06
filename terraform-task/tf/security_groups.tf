#ALB Security Group
module "alb_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.project_name}-${var.env}-alb-sg"
  description = "Security group for ALB publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp"]

  # Define Outbound Traffic
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open to internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

#ECS Security Group
module "ecs_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.project_name}-${var.env}-ecs-sg"
  description = "Security group for ECS to allow ALB to access ECS"
  vpc_id      = module.vpc.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      from_port                = var.ecs_ports[0].from_port
      to_port                  = var.ecs_ports[0].to_port
      protocol                 = "tcp"
      description              = "Allow ALB to access ECS"
      source_security_group_id = module.alb_sg.security_group_id
    },
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  # Define Outbound Traffic
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open to internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}