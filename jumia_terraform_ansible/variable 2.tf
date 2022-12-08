# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "devops-vpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type        = list(string)
  default     = ["eu-south-1a", "eu-south-1b", "eu-south-1c"]
}

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24", "10.0.153.0/24"]
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type        = bool
  default     = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type        = bool
  default     = true
}


# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = false
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = false
}

# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "eu-south-1"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "production"
}

# Environment Variable
variable "owners" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "devops"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_instance_class" {
  default = "db.t3.micro"

}
variable "db_engine_version" {
  default = "13"

}
variable "db_engine" {
  default = "postgres"

}
variable "db_storage_size" {
  default = 20
}

variable "vpc_id" {
  default = ""
}

variable "egress_rules" {
  default = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Outbound"
  }]
}


variable "lb_ingress_rules" {
  default = [{
    from_port   = 443
    to_port     = 443
    description = "Port 443"
    },
    {
      from_port   = 80
      to_port     = 80
      description = "Port 80"
    },
    {
      from_port   = 22
      to_port     = 22
      description = "Port 22"
  }]
}

variable "app_ingress_rules" {
  default = [{
    from_port   = 443
    to_port     = 443
    description = "Port 443"
    },
    {
      from_port   = 80
      to_port     = 80
      description = "Port 80"
    },
    {
      from_port   = 1337
      to_port     = 1337
      description = "Port 1337"
    },
    {
      from_port   = 22
      to_port     = 22
      description = "Port 22"
    }
  ]
}

variable "db_ingress_rules" {
  default = [
    {
      from_port   = 5432
      to_port     = 5432
      description = "Port 5432"
    },
    {
      from_port   = 22
      to_port     = 22
      description = "Port 22"
    }
  ]
}

variable "new_db_name" {
  default = "jumia_phone_validator"
}

variable "new_db_user" {
  default = "jumia"
}
