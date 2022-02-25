
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
    
    recordno,
    _fivetran_deleted,
    _fivetran_synced,
    auwhencreated,
    billtopaytocontactname,
    billtopaytokey,
    cf_sales_type,
    createdby,
    currency,
    custemailoptin,
    customerid,
    customername,
    description,
    description_2,
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
    totaldue,
    totalentered,
    totalpaid,
    totalretained,
    totalselected,
    trx_entitydue,
    trx_totaldue,
    trx_totalentered,
    trx_totalpaid,
    trx_totalreleased,
    trx_totalretained,
    trx_totalselected,
    whencreated,
    whendiscount,
    whendue,
    whenmodified,
    whenpaid,
    whenposted

    from fields
)

select * from final
