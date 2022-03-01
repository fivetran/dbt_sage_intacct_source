
with base as (

    select * 
    from {{ ref('stg_sage_intacct__ar_invoice_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__ar_invoice_tmp')),
                staging_columns=get_ar_invoice_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    recordno as invoice_id,
    _fivetran_deleted,
    _fivetran_synced,
    auwhencreated,
    billtopaytocontactname,
    billtopaytokey,
    createdby,
    currency,
    custemailoptin,
    customerid,
    customername,
    description,
    docnumber,
    due_in_days,
    megaentityid,
    megaentitykey,
    megaentityname,
    recordid,
    recordtype,
    shiptoreturntocontactname,
    shiptoreturntokey,
    state,
    systemgenerated,
    totaldue as total_due,
    totalentered as total_entered,
    totalpaid as total_paid,
    whencreated,
    whendue,
    whenmodified,
    whenpaid,
    whenposted

    from fields
)

select * from final
