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

## Initial Release
- This is the initial release of this package. For more information refer to the [README](/README.md).

