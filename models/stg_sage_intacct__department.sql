
with base as (

    select * 
    from {{ ref('stg_sage_intacct__department_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__department_tmp')),
                staging_columns=get_department_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    departmentid,
    _fivetran_deleted,
    _fivetran_synced,
    createdby,
    custtitle,
    modifiedby,
    recordno,
    status,
    title,
    whencreated,
    whenmodified,
    parentkey,
    parentid

    from fields
)

select * from final
