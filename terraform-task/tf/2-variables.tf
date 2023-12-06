
/* Global Variables */
variable "project_name" {
  type        = string
  description = "Project Name"
  default     = "Terraform"
}

/*
// Common variables
*/

variable "region" {
  type        = string
  description = "Region to work on."
  default     = "us-east-1"
}

variable "env" {
  type        = string
  description = "Stage to work on (dev/stg/prod)."
  default     = "dev"
}

variable "tags" {
  type        = map(string)
  description = "Tags to add to all resources."
  default     = {}
}

/*
// VPC variables
*/

variable "vpc_cidr" {
  type        = string
  description = "CIDR of your VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name of your VPC"
  default     = "terraform-vpc"
}

variable "vpc_private_cidrs" {
  type        = list(string)
  description = "Your private subnets"
  default     = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_public_cidrs" {
  type        = list(string)
  description = "Your public subnets"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_database_cidrs" {
  type        = list(string)
  description = "Your database subnets"
  default     = ["10.0.200.0/24", "10.0.201.0/24", "10.0.202.0/24"]
}

variable "vpc_azs" {
  type        = list(string)
  description = "Your VPC availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

/*
// ACM Variables
*/
# variable "domain_name" {
#   type        = string
#   description = "Domain to get the ACM for"
# }
/* ECR Varaibles*/
variable "ecr_name" {
  type        = string
  description = "The Name of the application or solution (e.g. bastion or portal)"
  default     = "ecr"
}


variable "ecr_image_names" {
  type        = list(string)
  description = "List of Docker local image names, used as repository names for AWS ECR"
  default     = []
}


/* ECS Container Variables */
variable "ecs_ports" {
  type = list(object({
    from_port = number
    to_port   = number
  }))
  description = "ECS Container ports"
  default = [
    {
      from_port = 3000
      to_port   = 3000
    }
  ]
}