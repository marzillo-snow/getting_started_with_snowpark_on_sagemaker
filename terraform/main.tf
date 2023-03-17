terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.55.0"
    }
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.54.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  shared_config_files      = [var.aws_shared_config_files]
  shared_credentials_files = [var.aws_shared_credentials_files]
  profile                  = var.aws_profile
}

/* For the purpose of this lab, unless you're already using Terraform,
it will be easier to just run the two lines of SQL above in the Snowflake console.

However, if you're comfortable with Terraform or want to learn, you can uncomment
the code below and follow the guide here to set up your connection:
https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html

Terraform with Snowflake comes into its own when you want to automate
the creation of many Snowflake objects in a reliable, repeatable format.
*/
/*
provider "snowflake" {
  account = var.snowflake_account
  username = var.snowflake_username
  private_key_path = var.snowflake_private_key_path 
  role = var.snowflake_role # default: ACCOUNTADMIN for simplicity in demo accounts
}
*/

output "sagemaker_studio_domain_name" {
  description = "SageMaker Studio Domain Name"
  value       = aws_sagemaker_domain.sagemaker_studio_domain.domain_name
}

output "sagemaker_studio_domain_arn" {
  description = "SageMaker Studio Domain ARN"
  value       = aws_sagemaker_domain.sagemaker_studio_domain.arn
}

