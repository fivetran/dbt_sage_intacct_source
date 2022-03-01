
with base as (

    select * 
    from {{ ref('stg_sage_intacct__ar_invoice_item_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__ar_invoice_item_tmp')),
                staging_columns=get_ar_invoice_item_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    recordkey as invoice_id,
    recordno as invoice_item_id,
    _fivetran_synced,
    accountkey,
    accountno,
    accounttitle,
    amount,
    basecurr,
    baselocation,
    classid,
    classname,
    currency,
    customerid,
    customername,
    departmentid,
    departmentname,
    entry_date,
    entrydescription,
    exchange_rate,
    itemdimkey,
    itemid,
    itemname,
    line_no,
    lineitem,
    locationid,
    locationname,
    offsetglaccountno,
    offsetglaccounttitle,
    recordtype,
    state,
    totalpaid,
    vendorid,
    vendorname,
    whencreated,
    whenmodified,
    warehouseid,
    warehousename

    from fields
)

select * from final
