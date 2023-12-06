
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = "${var.project_name}-${var.env}-alb"

  load_balancer_type = "application"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets


  security_groups = [module.alb_sg.security_group_id]

  target_groups = [
    {
      name             = "${var.project_name}-${var.env}-backend-tg"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
      vpc_id           = module.vpc.vpc_id
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = 80
        healthy_threshold   = 2
        unhealthy_threshold = 10
        timeout             = 25
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    }
  ]
  # HTTP Listener 
  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      # action_type = "redirect"
      # redirect = {
      #   port        = 443
      #   protocol    = "HTTPS"
      #   status_code = "HTTP_301"
      # }
    }
  ]
}
  # HTTPS Listener 
#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = module.acm.acm_certificate_arn
#       target_group_index = 0
#     }
#   ]
# }