
with base as (

    select * 
    from {{ ref('stg_sage_intacct__item_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sage_intacct__item_tmp')),
                staging_columns=get_item_columns()
            )
        }}
        
    from base
),

final as (
    
    select 

    itemid,
    _fivetran_deleted,
    _fivetran_synced,
    allow_backorder,
    allowmultipletaxgrps,
    autoprintlabel,
    baseprice,
    baseuom,
    buytoorder,
    cf_brand,
    cf_quantity_per_case_or_box,
    cf_quantity_per_pallet,
    cf_quantity_per_pallet_notes,
    cf_state_sold,
    cf_use,
    cf_verano_inventory_part,
    cf_verano_inventory_part_size,
    cndefaultbundle,
    computeforshortterm,
    cost_method,
    createdby,
    dropship,
    enablelandedcost,
    extended_description,
    glgroup,
    glgrpkey,
    hasstartenddates,
    inv_precision,
    ionorder,
    itemtype,
    modifiedby,
    mrr,
    name,
    po_precision,
    podescription,
    productlineid,
    producttype,
    recordno,
    revprinting,
    sodescription,
    status,
    taxable,
    uomgrp,
    uomgrpkey,
    vsoecategory,
    vsoedlvrstatus,
    vsoerevdefstatus,
    whencreated,
    whenmodified,
    megaentityname
    megaentitykey,
    megaentityid,
    ionhand,
    standard_cost,
    cf_cost_analysis,
    safetyitem,
    restricteditem,
    engineeringapproval,
    qualitycontrolapproval,
    giftcard,
    webenabled,
    salesapproval,
    compliantitem,
    uom_souomdetail_unit,
    uom_souomdetail_convfactor,
    uom_pouomdetail_convfactor,
    uom_invuomdetail_unit,
    uom_pouomdetail_unit,
    whenlastreceived,
    whenlastsold,
    upc

    from fields
)

select * from final
