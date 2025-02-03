# dbt_sage_intacct_source v0.4.0

## Breaking Changes
- Reintroduced `_fivetran_deleted`. 

# dbt_sage_intacct_source v0.3.1
[PR #16](https://github.com/fivetran/dbt_sage_intacct_source/pull/16) includes the following updates:

## Bug Fixes
- Included the `sage_intacct__using_bills` variable as an enablement config for the following models as it was erroneously omitted in previously releases:
    - `stg_sage_intacct__ap_bill_item_tmp`
    - `stg_sage_intacct__ap_bill_tmp`

# dbt_sage_intacct_source v0.3.0

[PR #14](https://github.com/fivetran/dbt_sage_intacct_source/pull/14) includes the following updates.

## 🚨 Breaking Changes 🚨:
- Removal of the `_fivetran_deleted` field from the `stg_sage_intacct__gl_detail` table due to this field being deprecated within the connector. The relevant information is now available within the `gl_batch` source table.

## Bug Fixes
- Cast the `class_id` field within the following models as `{{ dbt.type_string() }}` in order to ensure datatype consistency for the field across models. This also ensures downstream transformation logic within `dbt_sage_intacct` compiles successfully.
    - `stg_sage_intacct__ap_bill_item`
    - `stg_sage_intacct__ar_invoice_item`

## Feature Updates
- Addition of the `gl_batch` source and relevant downstream models:
    - `stg_sage_intacct__gl_batch_tmp`
    - `stg_sage_intacct__gl_batch`

## Under the Hood
- Updated Maintainer PR Template
- Included auto-releaser GitHub Actions workflow to automate future releases

# dbt_sage_intacct_source v0.2.1

A very spoooOOOOOooooky release 🎃 👻

## Bug Fixes
- Explicitly casts `department_id`, `location_id`, and `item_id` as strings in the staging `ap_bill_item` and `ar_invoice_item` models, which are unioned together downstream in [`sage_intacct_ap_ar_enhanced`](https://fivetran.github.io/dbt_sage_intacct/#!/model/model.sage_intacct.sage_intacct__ap_ar_enhanced) ([PR #12](https://github.com/fivetran/dbt_sage_intacct_source/pull/12)).

## Under the Hood:
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job ([PR #11](https://github.com/fivetran/dbt_sage_intacct_source/pull/11)).
- Updated the pull request [templates](/.github) ([PR #11](https://github.com/fivetran/dbt_sage_intacct_source/pull/11)).

# dbt_sage_intacct_source v0.2.0

## 🚨 Breaking Changes 🚨:
[PR #10](https://github.com/fivetran/dbt_sage_intacct_source/pull/10) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- Dependencies on `fivetran/fivetran_utils` have been upgraded, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

# dbt_sage_intacct_source v0.1.2
 
## Updates
- Removed the `_fivetran_deleted` filter in the `stg_sage_intacct__gl_account`. We saw there were records in the `gl_detail` table that were associated with accounts that were deleted, which affected our joins and bubbled up later in the final P&L and balance sheet models. By removing the filter the balances tie out. However, we've kept `_fivetran_deleted` as a column so the user may filter that out on their own.
([#8](https://github.com/fivetran/dbt_sage_intacct_source/pull/8))

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
