
with base as (

    select * 
    from {{ ref('stg_sage_intacct__gl_detail_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__gl_detail_tmp')),
                staging_columns=get_gl_detail_columns()
            )
        }}
        
    from base
),

final as (
    
    select 

    recordno,
    cast(accountno as decimal) as accountno,
    accounttitle,
    amount,
    batch_date,
    batch_no,
    batch_title,
    batchkey,
    bookid,
    creditamount,
    debitamount,
    departmentid,
    departmenttitle
    description,
    docnumber,
    entry_date,
    entrydescription,
    line_no,
    modified,
    recordid,
    recordtype,
    totaldue,
    totalentered,
    totalpaid,
    tr_type,
    trx_amount,
    trx_creditamount,
    trx_debitamount,
    whencreated,
    whendue,
    whenmodified,
    whenpaid

    from fields
)

select * from final
