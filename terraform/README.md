## First time terraform setup
The focus of this Quickstart isn't Terraform, however if you would like to try creating the infrastructure yourself using Terraform, you can follow the steps below:

1. Set up your environment to run Terraform locally using the [Terraforming Snowflake Quickstart](https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html)
2. Run `terraform init` to initialize the Terraform environment
3. Create and complete the `terraform.tfvars` file with your AWS and Snowflake account information in line with the `variables.tf` file - this file is ignored by git, and in a production setup you would use a secrets manager to store this information
4. Run `terraform plan` to see what resources will be created
5. Run `terraform apply` to create the resources

You're now good to go!