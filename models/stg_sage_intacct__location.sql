
with base as (

    select * 
    from {{ ref('stg_sage_intacct__location_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__location_tmp')),
                staging_columns=get_location_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    
    locationid,
    _fivetran_deleted,
    _fivetran_synced,
    businessdays,
    cf_internal_categorization,
    cf_internal_region,
    contactkey,
    createdby,
    custtitle,
    federalid,
    firstmonth,
    firstmonthtax,
    has_ie_relation,
    isroot,
    modifiedby,
    name,
    parentid,
    parentkey,
    recordno,
    reportprintas,
    shiptokey,
    status,
    weekends,
    weekstart,
    whencreated,
    whenmodified,
    taxid,
    contactinfo_mailaddress_country,
    contactinfo_contactname,
    contactinfo_mailaddress_countrycode,
    contactinfo_printas,
    vendentity,
    custentity,
    customerid,
    vendorid,
    customername,
    vendorname,
    shipto_mailaddress_zip,
    contactinfo_mailaddress_zip,
    shipto_mailaddress_address_1,
    contactinfo_mailaddress_address_1,
    shipto_mailaddress_countrycode,
    shipto_contactname,
    contactinfo_mailaddress_city,
    shipto_mailaddress_state,
    shipto_mailaddress_country,
    shipto_mailaddress_city,
    contactinfo_mailaddress_state,
    supervisorname,
    supervisorkey
    supervisorid,
    shipto_phone_1,
    contactinfo_phone_1,
    cf_cip_allowed,
    contactinfo_email_1,
    contactinfo_mailaddress_address_2

    from fields
)

select * from final
