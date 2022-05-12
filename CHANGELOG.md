# dbt_sage_intacct_source v0.1.2
 
## Updates
- Removed the `_fivetran_deleted` filter in the `stg_sage_intacct__gl_account`. We saw there were records in the `gl_detail` table that were associated with accounts that were deleted, which affected our joins and bubbled up later in the final P&L and balance sheet models. By removing the filter the balances tie out. However, we've kept _fivetran_deleted as a column so the user may filter that out on their own.

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

## Initial Release
- This is the initial release of this package. For more information refer to the [README](/README.md).

