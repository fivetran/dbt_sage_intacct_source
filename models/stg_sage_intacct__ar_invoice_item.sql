
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
    
    cast(recordkey as string) as invoice_id,
    cast(recordno as string) as invoice_item_id,
    _fivetran_synced,
    accountkey as account_key,
    accountno as account_no,
    accounttitle as account_title,
    amount as amount,
    basecurr as base_curr,
    baselocation as base_location,
    classid as class_id,
    classname as class_name,
    currency as currency,
    customerid as customer_id,
    customername as customer_name,
    departmentid as department_id,
    departmentname as department_name,
    entry_date as entry_date,
    entrydescription as entry_description,
    exchange_rate as exchange_rate,
    itemdimkey as item_dim_key,
    itemid as item_id,
    itemname as item_name,
    line_no as line_no,
    lineitem as line_item,
    locationid as location_id,
    locationname as location_name,
    offsetglaccountno as offset_gl_account_no,
    offsetglaccounttitle as offset_gl_account_title,
    recordtype as record_type,
    state as state,
    totalpaid as total_item_paid,
    totalselected as total_selected,
    vendorid as vendor_id,
    vendorname as vendor_name,
    whencreated as when_created,
    whenmodified as when_modified,
    warehouseid as warehouse_id,
    warehousename as warehouse_name

    from fields
)

select * from final
