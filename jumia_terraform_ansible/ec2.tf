resource "random_integer" "subnet_index" {
  min = 0
  max = length([module.vpc.public_subnets]) - 1
}

module "loadbalancer" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  #version = "3.3.0"
  name                   = "loadbalancer"
  count                  = local.loadbalancer_instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  user_data              = file("${path.module}/installation/lb.sh")
  subnet_id              = module.vpc.public_subnets[random_integer.subnet_index.result]
  vpc_security_group_ids = [aws_security_group.lb_sg.id]
  depends_on = [
    module.vpc, aws_security_group.lb_sg
  ]
  tags = local.common_tags
}


module "application" {
  source = "terraform-aws-modules/ec2-instance/aws"
  #version = "~> 3.0"
  version = "3.3.0"

  name                   = "application"
  count                  = local.app_instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/installation/app.sh")
  key_name               = aws_key_pair.deployer.key_name
  subnet_id              = module.vpc.public_subnets[random_integer.subnet_index.result]
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  #iam_instance_profile = aws_iam_role.devops_role.name
  depends_on = [module.vpc, module.loadbalancer, aws_security_group.app_sg]
  tags       = local.common_tags
}
