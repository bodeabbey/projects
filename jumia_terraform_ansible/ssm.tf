# resource "aws_ssm_parameter" "db_url" {
#   name  = "/production/db/url"
#   type  = "String"
#   value = element(split(":", aws_db_instance.postgres.endpoint),0)
#   depends_on = [
#     aws_db_instance.postgres
#   ]
# }

# resource "aws_ssm_parameter" "password" {
#   name = "/production/db/password"
#   description = "production db password. Don't modify the value because it was generated automatically and can be modified during fresh deployment"
#   type = "SecureString"
#   value = random_password.master.result
#     tags = {
#     env = "production"
#   }
# }
# resource "aws_ssm_parameter" "db_username" {
#   name  = "/production/db/username"
#   type  = "String"
#   value = "productionadmin"
# }
# data "aws_ssm_parameter" "db_password" {
#     name = "/software/production/db/password"
#     depends_on = [
#       aws_ssm_parameter.password
#     ]
# }
