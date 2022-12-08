# resource "aws_iam_role" "devops_role" {
#   name = "devops-role"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         "Action": [
#         "sts:AssumeRole",
#         "ecr:PutImage",
#         "ecr:DescribeImage",
#         "ecr:ListImage",
#         "ssm:GetParameters",
#         "secretsmanager:GetSecretValue",
#         "kms:Decrypt"
#       ],
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     tag-key = "devops-role"
#   }
# }