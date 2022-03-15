-- I applied some changes in this model to fit with our style standards. Please update the other staging models to fit the same style.
-- Specifically we want the fields we are selecting from to be indented once and also only rename fields that are actually being renamed.
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
        cast(recordkey as {{ dbt_utils.type_string() }}) as bill_id,
        cast(recordno as {{dbt_utils.type_string() }}) as bill_item_id,
        _fivetran_synced,
        accountkey as account_key,
        accountno as account_no,
        accounttitle as account_title,
        amount as amount, -- Why are we renaming this?
        basecurr as base_curr,
        baselocation as base_location,
        billable as billable, -- Why are we renaming this?
        billed as billed, -- Why are we renaming this?
        classid as class_id,
        classname as class_name,
        createdby as created_by,
        currency as currency, -- Why are we renaming this?
        customerid as customer_id,
        customername as customer_name,
        departmentid as department_id,
        departmentname as department_name,
        entry_date as entry_date_at,
        entrydescription as entry_description,
        exchange_rate as exchange_rate, -- Why are we renaming this?
        itemid as item_id,
        itemname as item_name,
        line_no as line_no, -- Why are we renaming this?
        lineitem as line_item,
        locationid as location_id,
        locationname as location_name,
        offsetglaccountno as offset_gl_account_no,
        offsetglaccounttitle as offset_gl_account_title,
        recordtype as record_type,
        state as state, -- Why are we renaming this?
        totalpaid as total_item_paid,
        totalselected as total_selected,
        vendorid as vendor_id,
        vendorname as vendor_name,
        whencreated as created_at,
        whenmodified as modified_at,
        projectname as project_name,
        projectid as project_id

    from fields

)

select * 
from final
