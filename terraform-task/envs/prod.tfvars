
project_name = "Terraform"
env          = "PROD"

vpc_name     = "Terraform-VPC"


ecs_ports    = [
    {
        from_port = 3000
        to_port = 3000
    }
]

