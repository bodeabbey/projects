# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/ansible/hosts.tpl",
    {
      app_public_ips  = module.application.*.public_ip
      app_private_ips = module.application.*.private_ip
      lb_public_ips   = module.loadbalancer.*.public_ip
    }
  )
  filename = "./hosts"
  depends_on = [
    module.application, module.loadbalancer, aws_db_instance.postgres
  ]
}

resource "local_file" "db_details" {
  content = templatefile("${path.module}/ansible/db_details.tpl",
    {
      db_username       = aws_db_instance.postgres.username
      db_name           = aws_db_instance.postgres.db_name
      db_password       = random_password.master.result
      db_host           = element(split(":", aws_db_instance.postgres.endpoint), 0)
      new_db_name       = var.new_db_name
      new_db_user       = var.new_db_user
      new_user_password = random_password.new_db_user.result
    }
  )
  filename = "./ansible/plays/db_vars.yml"
  depends_on = [
    aws_db_instance.postgres
  ]
}

resource "local_file" "sql_script" {
  content = templatefile("${path.module}/database/create.tpl",
    {
      new_db_name     = var.new_db_name
      new_db_user     = var.new_db_user
      new_db_password = random_password.new_db_user.result
    }
  )
  filename = "./database/create.sql"
  depends_on = [
    aws_db_instance.postgres
  ]
}

resource "local_file" "java_properties" {
  content = templatefile("${path.module}/backend/application.properties.tpl",
    {
      spring_host     = element(split(":", aws_db_instance.postgres.endpoint), 0)
      spring_user     = var.new_db_user
      spring_password = random_password.new_db_user.result
      spring_db       = var.new_db_name
    }
  )
  filename = "./backend/application.properties"
  depends_on = [
    module.application, module.loadbalancer, aws_db_instance.postgres
  ]
}

# data "template_file" "dev_hosts" {
#   template = "${file("${path.module}/templates/dev_hosts.cfg")}"
#   depends_on = [
#     "aws_instance.dev-api-gateway",
#     "aws_instance.dev-api-gateway-internal",
#     ....
#   ]
#   vars {
#     api_public = "${aws_instance.dev-api-gateway.private_ip}"
#     api_internal = "${aws_instance.dev-api-gateway-internal.private_ip}"
#   }
# }

# resource "null_resource" "dev-hosts" {
#   triggers {
#     template_rendered = "${data.template_file.dev_hosts.rendered}"
#   }
#   provisioner "local-exec" {
#     command = "echo '${data.template_file.dev_hosts.rendered}' > dev_hosts"
#   }
# }