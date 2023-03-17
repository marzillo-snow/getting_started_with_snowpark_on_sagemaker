locals {
  vpc_id_is_empty           = var.vpc_id == ""
  subnet_ids_is_empty       = length(var.subnet_ids) == 0
  security_group_ids_is_empty = length(var.security_group_ids) == 0
  sagemaker_role_arn_is_empty = var.sagemaker_role_arn == ""
}

resource "aws_vpc" "default_vpc" {
  count = local.vpc_id_is_empty ? 1 : 0

  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "DefaultVPC"
  }
}

resource "aws_subnet" "default_subnet" {
  count = local.subnet_ids_is_empty ? 1 : 0

  cidr_block = "10.0.1.0/24"
  vpc_id     = local.vpc_id_is_empty ? aws_vpc.default_vpc[0].id : var.vpc_id
  tags = {
    Name = "DefaultSubnet"
  }
}

resource "aws_security_group" "default_security_group" {
  count = local.security_group_ids_is_empty ? 1 : 0

  name        = "DefaultSecurityGroup"
  description = "Default security group for SageMaker Studio"
  vpc_id      = local.vpc_id_is_empty ? aws_vpc.default_vpc[0].id : var.vpc_id
}

resource "aws_sagemaker_domain" "sagemaker_studio_domain" {
  domain_name = var.sagemaker_domain_name
  auth_mode   = "IAM"
  vpc_id      = local.vpc_id_is_empty ? aws_vpc.default_vpc[0].id : var.vpc_id
  subnet_ids  = local.subnet_ids_is_empty ? [aws_subnet.default_subnet[0].id] : var.subnet_ids

  default_user_settings {
    execution_role = local.sagemaker_role_arn_is_empty ? aws_iam_role.execution_role[0].arn : var.sagemaker_role_arn
    security_groups = local.security_group_ids_is_empty ? [aws_security_group.default_security_group[0].id] : var.security_group_ids
  }
}

resource "aws_iam_role" "execution_role" {
  count = local.sagemaker_role_arn_is_empty ? 1 : 0

  name               = "SageMakerExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      }
    ]
  })

  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"]
  path                = "/service-role/"
}