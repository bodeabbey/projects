resource "random_password" "master" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "random_password" "new_db_user" {
  length           = 10
  special          = true
  override_special = "_!%^"
}

resource "random_string" "db_id" {
  length      = 4
  special     = false
  min_lower   = 3
  min_numeric = 1
}

resource "aws_db_subnet_group" "production" {
  name       = "rds_subnet"
  subnet_ids = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  tags = {
    Name = "production"
  }
}

resource "aws_db_instance" "postgres" {
  backup_retention_period = 1
  publicly_accessible     = true
  identifier              = "production-db-${random_string.db_id.result}"
  allocated_storage       = var.db_storage_size
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  db_name                 = "productionrds"
  username                = "productionadmin"
  password                = random_password.master.result
  parameter_group_name    = aws_db_parameter_group.production.name
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.production.name
  vpc_security_group_ids  = [aws_security_group.app_sg.id, aws_security_group.db_sg.id]
  depends_on = [
    module.vpc, aws_security_group.db_sg
  ]
  tags = {
    env = "production"
  }
}

resource "aws_db_parameter_group" "production" {
  name   = "production"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

