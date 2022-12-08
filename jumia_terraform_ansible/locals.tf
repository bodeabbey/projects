locals {
  loadbalancer_instance_count = 1
  app_instance_count          = 3
  db_count                    = 1
  owners                      = var.owners
  environment                 = var.environment
  name                        = "${var.owners}-${var.environment}"

  common_tags = {
    owners      = local.owners
    environment = local.environment
  }

} 