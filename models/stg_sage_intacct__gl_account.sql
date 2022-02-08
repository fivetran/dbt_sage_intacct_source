
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

    cast(accountno as decimal) as account_no,
    _fivetran_deleted,	
    _fivetran_synced,	
    -- accounttype,	
    -- alternativeaccount,	
    category,	
    -- categorykey,	
    -- cf_verano_account_group,	
    -- closetoacctkey,	
    -- closingaccountno,	
    -- closingaccounttitle,	
    -- closingtype,	
    -- createdby,	
    -- modifiedby,	
    -- normalbalance,	
    -- recordno,	
    -- requireclass,	
    -- requirecustomer,	
    -- requiredept,	
    -- requireemployee,	
    -- requireitem,	
    -- requireloc,	
    -- requirevendor,	
    -- requirewarehouse,	
    -- status,	
    -- subledgercontrolon,	
    -- taxable,	
    -- title,	
    -- whencreated,	
    -- whenmodified,	
    -- cf_legacy_coa,	
    -- requireproject,	
    -- cf_legacy_mapping_notes,	
    cf_fs_group_5,	
    cf_fs_group_4,	
    cf_fs_group_3,	
    cf_fs_group_2,	
    cf_fs_group_1
    -- ,	
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
    -- cf_bs_group_5,	
    -- cf_reporting_group_1

    from fields
)

select * from final
