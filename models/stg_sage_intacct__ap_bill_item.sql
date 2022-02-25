
with base as (

    select * 
    from {{ ref('stg_sage_intacct__ap_bill_item_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__ap_bill_item_tmp')),
                staging_columns=get_ap_bill_item_columns()
            )
        }}
        
    from base
),

final as (
    
    select 

    recordkey,
    recordno,
    _fivetran_synced,
    accountkey,
    accountno,
    accounttitle,
    amount,
    basecurr,
    baselocation,
    billable,
    billed,
    classdimkey,
    classid,
    classname,
    createdby,
    currency,
    customerdimkey,
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
    prentryoffsetaccountno,
    recordtype,
    state,
    totalpaid,
    totalselected,
    trx_amount,
    trx_totalpaid,
    trx_totalselected,
    vendordimkey,
    vendorid,
    vendorname,
    whencreated,
    whenmodified,
    projectname,
    projectdimkey,
    projectid

    from fields
)

select * from final
