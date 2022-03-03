
with base as (

    select * 
    from {{ ref('stg_sage_intacct__gl_acct_grp_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__gl_acct_grp_tmp')),
                staging_columns=get_gl_acct_grp_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    -- rename here
    from fields
)

select * from final
