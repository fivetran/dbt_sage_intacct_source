
with base as (

    select * 
    from {{ ref('stg_sage_intacct__ap_bill_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__ap_bill_tmp')),
                staging_columns=get_ap_bill_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    recordno as bill_id,
    _fivetran_deleted,
    _fivetran_synced,
    auwhencreated,
    basecurr,
    billtopaytocontactname,
    billtopaytokey,
    currency,
    description,
    docnumber,
    due_in_days,
    recordid,
    recordtype,
    shiptoreturntocontactname,
    shiptoreturntokey,
    state,
    totaldue as total_due,
    totalentered as total_entered,
    totalpaid as total_paid,
    vendorid,
    vendorname,
    whencreated,
    whendue,
    whenmodified,
    whenpaid,
    whenposted

    from fields
)

select * from final
