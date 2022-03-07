
with base as (

    select * 
    from {{ ref('stg_sage_intacct__gl_account_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__gl_account_tmp')),
                staging_columns=get_gl_account_columns()
            )
        }}
        
    from base
),

final as (
    
    select 

    cast(accountno as string) as account_no,
    _fivetran_deleted,	
    _fivetran_synced,	
    accounttype as account_type,	
    alternativeaccount as alternative_account,	
    category,	
    categorykey as category_key,	
    closetoacctkey as close_to_acct_key,	
    closingaccountno as closing_account_no,	
    closingaccounttitle as closing_account_title,	
    closingtype as closing_type,	
    createdby as created_by,	
    modifiedby as modified_by,	
    normalbalance as normal_balance,	
    recordno as gl_account_id,	
    status,	
    taxable,	
    title,	
    whencreated as created_at,	
    whenmodified as modified_at,	
    -- cf_fs_group_5,	
    -- cf_fs_group_4,	
    -- cf_fs_group_3,	
    -- cf_fs_group_2,	
    -- cf_fs_group_1,
    -- cf_category,	
    -- cf_bs_group_1,	
    -- cf_bs_account_group,	
    -- cf_bs_account_name,	
    -- cf_account_group,	
    -- cf_bs_order_summary,	
    -- cf_is_order_detail,	
    -- cf_is_order_summary,	
    -- cf_bs_group_3,	
    -- cf_bs_group_2,	
    -- cf_bs_group_4,
    -- cf_bs_group_5,	
    -- cf_reporting_group_1,
    -- cf_bs_order_detail,
    -- cf_bs_account_number,	
    -- cf_header_account

    from fields
)

select * from final
