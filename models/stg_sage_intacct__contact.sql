
with base as (

    select * 
    from {{ ref('stg_sage_intacct__contact_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__contact_tmp')),
                staging_columns=get_contact_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        
        recordno,
        _fivetran_deleted,
        _fivetran_synced,
        address_1,
        address_2,
        admin_user_key,
        city,
        contactemail,
        contactname,
        contractcustomerid,
        country,
        countrycode,
        created,
        legaladdress_1,
        legaladdress_2,
        legalcity,
        legalcountry,
        legalcountrycode,
        legalname,
        legalstate,
        legalzipcode,
        name,
        ordercustomerid,
        state,
        status,
        title,
        type,
        zipcode,
        logo,
        contactphone

    from fields
)

select * from final
