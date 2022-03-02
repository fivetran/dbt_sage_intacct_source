{% macro get_ar_invoice_item_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accountkey", "datatype": dbt_utils.type_int()},
    {"name": "accountno", "datatype": dbt_utils.type_int()},
    {"name": "accounttitle", "datatype": dbt_utils.type_string()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "basecurr", "datatype": dbt_utils.type_string()},
    {"name": "baselocation", "datatype": dbt_utils.type_int()},
    {"name": "classid", "datatype": dbt_utils.type_string()},
    {"name": "classname", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "customerid", "datatype": dbt_utils.type_string()},
    {"name": "customername", "datatype": dbt_utils.type_string()},
    {"name": "departmentid", "datatype": dbt_utils.type_string()},
    {"name": "departmentname", "datatype": dbt_utils.type_string()},
    {"name": "entry_date", "datatype": "date"},
    {"name": "entrydescription", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_int()},
    {"name": "itemid", "datatype": dbt_utils.type_string()},
    {"name": "itemname", "datatype": dbt_utils.type_string()},
    {"name": "line_no", "datatype": dbt_utils.type_int()},
    {"name": "lineitem", "datatype": "boolean"},
    {"name": "locationid", "datatype": dbt_utils.type_string()},
    {"name": "locationname", "datatype": dbt_utils.type_string()},
    {"name": "offsetglaccountno", "datatype": dbt_utils.type_int()},
    {"name": "offsetglaccounttitle", "datatype": dbt_utils.type_string()},
    {"name": "recordkey", "datatype": dbt_utils.type_string()},
    {"name": "recordno", "datatype": dbt_utils.type_string()},
    {"name": "recordtype", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "totalpaid", "datatype": dbt_utils.type_float()},
    {"name": "totalselected", "datatype": dbt_utils.type_int()},
    {"name": "vendorid", "datatype": dbt_utils.type_string()},
    {"name": "vendorname", "datatype": dbt_utils.type_string()},
    {"name": "warehouseid", "datatype": dbt_utils.type_string()},
    {"name": "warehousename", "datatype": dbt_utils.type_string()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
