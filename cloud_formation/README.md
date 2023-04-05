## First time CloudFormation setup
You can complete this lab without using CloudFormation, but if you would like to create the AWS infrastructure yourself using CloudFormation, you can follow the steps below:

1. Log into your AWS account and navigate to the [CloudFormation console](https://console.aws.amazon.com/cloudformation/home)
2. Upload the `cloud_formation/SageMakerStudioCFT.yml` file to CloudFormation
3. Enter a stack name and click "Next" for each step with the default values (optional: you can change the default values if you would like to use a different VPC or subnet)
4. Finally, check the box to acknowledge that CloudFormation will create IAM resources and click "Submit" to start the stack creation
5. Wait for the stack to complete creation
 
You will now have the infrastructure needed to complete the lab - the only part you'll need to create is a user in the SageMaker Studio domain, and your database and role in Snowflake as outlined in the Quickstart.

### Why doesn't this create the Snowflake user and role?
CloudFormation can't easily be used to create a user and role in Snowflake because it's designed to provision resources in AWS native services, not third party tools like Snowflake.

See the [Terraform instructions](../terraform/README.md) for an example of how to create a user and role in Snowflake as well as the required AWS resources.