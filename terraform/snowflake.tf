/* Equivalent SQL to the terraform code below:
CREATE OR REPLACE WAREHOUSE HOL_WH WITH WAREHOUSE_SIZE='X-SMALL';
CREATE OR REPLACE DATABASE HOL_DB;
*/

/* For the purpose of this lab, unless you're already using Terraform,
it will be easier to just run the two lines of SQL above in the Snowflake console.

However, if you're comfortable with Terraform or want to learn, you can uncomment
the code below and follow the guide here to set up your connection:
https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html

Terraform with Snowflake comes into its own when you want to automate
the creation of many Snowflake objects in a reliable, repeatable format.
*/

/*
resource "snowflake_database" "hol_db" {
    name = "HOL_DB"
}

resource "snowflake_warehouse" "hol_wh" {
    name = "HOL_WH"
    warehouse_size = "X-SMALL"
    auto_suspend = 60
    auto_resume = true
    min_cluster_count = 1
    max_cluster_count = 1
    initially_suspended = true
}
*/