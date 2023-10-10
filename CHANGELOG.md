# dbt_sage_intacct_source v0.1.2
## Updates
- Explicitly casts `department_id` in `stg_sage_intacct__ap_bill_item` and `stg_sage_intacct__ar_invoice_item` as string data type to avoid conflicts in downstream union. ()

# dbt_sage_intacct_source v0.1.1
 
## Updates
- Excludes fivetran-deleted rows in the staging models
([#7](https://github.com/fivetran/dbt_sage_intacct/issues/7))

- Allow for pass-through columns from the  `gl_detail` and `gl_account` source tables using the following variables. For more information please refer to the [README](https://github.com/fivetran/dbt_sage_intacct_source/blob/main/README.md#passthrough-columns)
    - `sage_account_pass_through_columns`
    - `sage_gl_pass_through_columns`

- Add variable configs for the AP Bill and AR Invoice related tables to allow users to disable them if not used. For more information please refer to the [README](https://github.com/fivetran/dbt_sage_intacct_source/blob/main/README.md#disabling-and-enabling-models)
    - `sage_intacct__using_bills`
    - `sage_intacct__using_invoices`

- Include additional fields in the `gl_detail` model: customer_id, customer_name, department_id, department_title, location_id, location_name, vendor_id, and vendor_name. 

([#6](https://github.com/fivetran/dbt_sage_intacct/issues/6))

## Contributors
Thank you @santi95 for raising these to our attention! ([#6](https://github.com/fivetran/dbt_sage_intacct_source/pull/6))

# dbt_sage_intacct_source v0.1.0

# 🎉 Initial Release 🎉 
- This is the initial release of this package. 

This package is designed enrich your Fivetran data by doing the following:

- Add descriptions to tables and columns that are synced using Fivetran
- Add freshness tests to source data
- Add column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Model staging tables, which will be used in our transform package

Currently the package supports Postgres, Redshift, BigQuery, Databricks and Snowflake. Additionally, this package is designed to work with dbt versions [">=1.0.0", "<2.0.0"].

- For more information refer to the [README](/README.md).
