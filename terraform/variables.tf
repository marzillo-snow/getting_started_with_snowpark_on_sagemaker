variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
  default     = "eu-west-2"
}

variable "aws_shared_config_files" {
  description = "The path to the AWS shared config file, typically located at ~/.aws/config."
  type        = string
}

variable "aws_shared_credentials_files" {
  description = "The path to the AWS shared config file, typically located at ~/.aws/credentials."
  type        = string
}

variable "aws_profile" {
  description = "The name of the AWS profile to use in the above credentials file."
  type        = string
  default     = "default"
}

variable "sagemaker_domain_name" {
  description = "SageMaker Studio Domain Name"
  type        = string
  default     = "SageMakerStudioDomain"
}

variable "vpc_id" {
  description = "Select the VPC for SageMaker Studio (optional)."
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Select the subnets for SageMaker Studio (optional)."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Select a security group for SageMaker Studio (optional)."
  type        = list(string)
  default     = []
}

variable "sagemaker_role_arn" {
  description = "ARN of the SageMaker IAM execution role. If you don't specify a role, a new role is created with AmazonSageMakerFullAccess managed policy."
  type        = string
  default     = ""
}

/*
variable "snowflake_account" {
  description = "Snowflake account name, e.g. xxxxx.eu-west-2.aws"
  type        = string
}

variable "snowflake_username" {
  description = "Snowflake username"
  type        = string
}

variable "snowflake_private_key_path" {
  description = "Path to the private key file, e.g. ~/.ssh/snowflake_key.p8"
  type        = string
}

variable "snowflake_role" {
  description = "Snowflake role (default: ACCOUNTADMIN))"
  type        = string
  default     = "ACCOUNTADMIN"
}
*/