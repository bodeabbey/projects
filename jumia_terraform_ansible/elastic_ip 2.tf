# # Create Elastic IP for loadbalancer Host
# resource "aws_eip" "loadbalancer_eip" {
#   for_each = { for lb in module.loadbalancer : lb.id => lb }
#   depends_on = [module.loadbalancer, module.vpc ]
#   instance = each.key
#   vpc      = true
#   tags = local.common_tags  
# }

# # Create Elastic IP for application Host
# resource "aws_eip" "application_eip" {
#   for_each = { for app in module.application : app.id => app }
#   depends_on = [module.application, module.vpc ]
#   instance = each.key
#   vpc      = true
#   tags = local.common_tags  
# }