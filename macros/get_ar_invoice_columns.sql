{% macro get_ar_invoice_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "auwhencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "basecurr", "datatype": dbt_utils.type_string()},
    {"name": "billtopaytocontactname", "datatype": dbt_utils.type_string()},
    {"name": "billtopaytokey", "datatype": dbt_utils.type_int()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "customerid", "datatype": dbt_utils.type_string()},
    {"name": "customername", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "docnumber", "datatype": dbt_utils.type_string()},
    {"name": "due_in_days", "datatype": dbt_utils.type_int()},
    {"name": "megaentityid", "datatype": dbt_utils.type_string()},
    {"name": "megaentitykey", "datatype": dbt_utils.type_int()},
    {"name": "megaentityname", "datatype": dbt_utils.type_string()},
    {"name": "recordid", "datatype": dbt_utils.type_string()},
    {"name": "recordno", "datatype": dbt_utils.type_string()},
    {"name": "recordtype", "datatype": dbt_utils.type_string()},
    {"name": "shiptoreturntocontactname", "datatype": dbt_utils.type_string()},
    {"name": "shiptoreturntokey", "datatype": dbt_utils.type_int()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "totaldue", "datatype": dbt_utils.type_float()},
    {"name": "totalentered", "datatype": dbt_utils.type_float()},
    {"name": "totalpaid", "datatype": dbt_utils.type_float()},
    {"name": "whencreated", "datatype": "date"},
    {"name": "whendiscount", "datatype": "date"},
    {"name": "whendue", "datatype": "date"},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenpaid", "datatype": "date"},
    {"name": "whenposted", "datatype": "date"}
] %}

{{ return(columns) }}

{% endmacro %}
