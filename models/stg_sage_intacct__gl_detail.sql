
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

    recordno as gl_detail_id,
    cast(accountno as string) as account_no,
    accounttitle as account_title,
    amount,
    batch_date,
    batch_no,
    batch_title,
    batchkey as batch_key,
    bookid as book_id,
    creditamount as credit_amount,
    debitamount as debit_amount,
    customerid as customer_id,
    customername as customer_name,
    description,
    docnumber as doc_number,
    entry_date as entry_date_at,
    entry_state,
    entrydescription as entry_description,
    line_no,
    recordid as record_id,
    recordtype as record_type,
    totaldue as total_due,
    totalentered as total_entered,
    totalpaid as total_paid,
    tr_type,
    trx_amount,
    trx_creditamount,
    trx_debitamount,
    vendorid as vendor_id,
    vendorname as vendor_name,
    whencreated as created_at,
    whendue as due_at,
    whenmodified as modified_at,
    whenpaid as paid_at

    from fields
)

select * from final
