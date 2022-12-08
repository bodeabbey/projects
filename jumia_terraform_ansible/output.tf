# VPC Output Values

output "app_public_ip" {
  description = "The the application ip"
  value       = module.application.*.public_ip
}

output "app_private_ip" {
  description = "The the application ip"
  value       = module.application.*.private_ip
}

output "lb_public_ip" {
  description = "The the loadbalancer ip"
  value       = module.loadbalancer.*.public_ip
}

output "rds_db_name" {
  description = "The rds_username"
  value       = aws_db_instance.postgres.db_name
}

output "rds_username" {
  description = "The rds_username"
  value       = aws_db_instance.postgres.username
}

output "rds_password" {
  description = "The rds_password"
  value       = random_password.master.result
  sensitive   = true
}

output "new_user_password" {
  description = "The rds_password"
  value       = random_password.new_db_user.result
  sensitive   = true
}

output "rds_endpoint" {
  description = "The rds_endpoint"
  value       = element(split(":", aws_db_instance.postgres.endpoint), 0)
}

output "new_db_user" {
  description = "The new_db_user"
  value       = var.new_db_user
}

output "new_db_name" {
  description = "The new_db_name"
  value       = var.new_db_name
}

# output "app_public_ips" {
#   description = "The the application ip"
#   value       = aws_eip.application_eip.*.public_ip
# }

# output "app_private_ips" {
#   description = "The the application ip"
#   value       = module.application.*.private_ip
# }

# output "lb_ips" {
#   description = "The the loadbalancer ip"
#   value       = aws_eip.loadbalancer_eip.*.public_ip
# }

# output "db_host" {
#   description = "The DB hostname"
#   value       = aws_db_instance.postgres.endpoint
# }

# # VPC ID
# output "vpc_id" {
#   description = "The ID of the VPC"
#   value       = module.vpc.vpc_id
# }

# # VPC CIDR blocks
# output "vpc_cidr_block" {
#   description = "The CIDR block of the VPC"
#   value       = module.vpc.vpc_cidr_block
# }

# # VPC Private Subnets
# output "private_subnets" {
#   description = "List of IDs of private subnets"
#   value       = module.vpc.private_subnets
# }

# # VPC Public Subnets
# output "public_subnets" {
#   description = "List of IDs of public subnets"
#   value       = module.vpc.public_subnets
# }

# # VPC NAT gateway Public IP
# output "nat_public_ips" {
#   description = "List of public Elastic IPs created for AWS NAT Gateway"
#   value       = module.vpc.nat_public_ips
# }

# # VPC AZs
# output "azs" {
#   description = "A list of availability zones spefified as argument to this module"
#   value       = module.vpc.azs
# }