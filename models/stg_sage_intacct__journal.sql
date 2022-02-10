
with base as (

    select * 
    from {{ ref('stg_sage_intacct__journal_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__journal_tmp')),
                staging_columns=get_journal_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    symbol,
    _fivetran_deleted,
    _fivetran_synced,
    billable,
    createdby,
    modifiedby,
    recordno,
    status,
    title,
    whencreated,
    whenmodified

    from fields
)

select * from final
