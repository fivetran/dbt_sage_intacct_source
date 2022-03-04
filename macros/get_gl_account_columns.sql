{% macro get_gl_account_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accountno", "datatype": dbt_utils.type_string()},
    {"name": "accounttype", "datatype": dbt_utils.type_string()},
    {"name": "alternativeaccount", "datatype": dbt_utils.type_string()},
    {"name": "category", "datatype": dbt_utils.type_string()},
    {"name": "categorykey", "datatype": dbt_utils.type_int()},
    {"name": "closetoacctkey", "datatype": dbt_utils.type_int()},
    {"name": "closingaccountno", "datatype": dbt_utils.type_int()},
    {"name": "closingaccounttitle", "datatype": dbt_utils.type_string()},
    {"name": "closingtype", "datatype": dbt_utils.type_string()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "normalbalance", "datatype": dbt_utils.type_string()},
    {"name": "recordno", "datatype": dbt_utils.type_int()},
    {"name": "requireclass", "datatype": "boolean"},
    {"name": "requirecustomer", "datatype": "boolean"},
    {"name": "requiredept", "datatype": "boolean"},
    {"name": "requireemployee", "datatype": "boolean"},
    {"name": "requireitem", "datatype": "boolean"},
    {"name": "requireloc", "datatype": "boolean"},
    {"name": "requireproject", "datatype": "boolean"},
    {"name": "requirevendor", "datatype": "boolean"},
    {"name": "requirewarehouse", "datatype": "boolean"},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "taxable", "datatype": "boolean"},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
