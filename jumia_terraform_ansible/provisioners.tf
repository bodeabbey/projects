# Create a Null Resource and Provisioners
resource "null_resource" "app_conectivity" {
  depends_on = [module.application]
  # Connection Block for Provisioners to connect to EC2 Instance
  # for_each = { for ips in module.application : ips.public_ip => ips }
  connection {
    type     = "ssh"
    host     = module.application[0].public_ip
    user     = "ubuntu"
    password = ""
    private_key = file("~/.ssh/id_rsa")
  }  

  provisioner "local-exec" {
    command = "ansible-playbook ansible/app_setup.ymllb_setup.yml"
  }
}


#Create a Null Resource and Provisioners
resource "null_resource" "lb_conectivity" {
  depends_on = [module.loadbalancer, aws_db_instance.postgres]
  # Connection Block for Provisioners to connect to EC2 Instance
  # for_each = { for ips in module.loadbalancer : ips.public_ip => ips }
  connection {
    type     = "ssh"
    host     = module.application[0].public_ip
    user     = "ubuntu"
    password = ""
    private_key = file("~/.ssh/id_rsa")
  }  

  provisioner "local-exec" {
    command = "ansible-playbook ansible/lb_setup.yml"
  }
}
