
with base as (

    select * 
    from {{ ref('stg_sage_intacct__employee_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__employee_tmp')),
                staging_columns=get_employee_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    employeeid,
    _fivetran_deleted,
    _fivetran_synced,
    achenabled,
    contact_name,
    contactkey,
    createdby,
    departmentid,
    departmentkey,
    employeetype,
    emptypekey,
    entity,
    expensify_restrict_invite,
    gender,
    generic,
    mergepaymentreq,
    modifiedby,
    paymentnotify,
    postactualcost,
    recordno,
    startdate,
    status,
    title,
    whencreated,
    whenmodified,
    locationkey,
    locationid,
    personalinfo_mailaddress_countrycode,
    personalinfo_contactname,
    personalinfo_mailaddress_country,
    personalinfo_printas,
    personalinfo_firstname,
    personalinfo_lastname,
    personalinfo_email_1,
    personalinfo_mailaddress_zip,
    personalinfo_mailaddress_state,
    personalinfo_mailaddress_address_2,
    personalinfo_mailaddress_city,
    personalinfo_companyname,
    personalinfo_mailaddress_address_

    from fields
)

select * from final
