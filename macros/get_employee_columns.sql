{% macro get_employee_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "achenabled", "datatype": "boolean"},
    {"name": "contact_name", "datatype": dbt_utils.type_string()},
    {"name": "contactkey", "datatype": dbt_utils.type_int()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "departmentid", "datatype": dbt_utils.type_string()},
    {"name": "departmentkey", "datatype": dbt_utils.type_int()},
    {"name": "employeeid", "datatype": dbt_utils.type_string()},
    {"name": "employeetype", "datatype": dbt_utils.type_string()},
    {"name": "emptypekey", "datatype": dbt_utils.type_int()},
    {"name": "entity", "datatype": dbt_utils.type_string()},
    {"name": "expensify_restrict_invite", "datatype": "boolean"},
    {"name": "gender", "datatype": dbt_utils.type_string()},
    {"name": "generic", "datatype": "boolean"},
    {"name": "locationid", "datatype": dbt_utils.type_string()},
    {"name": "locationkey", "datatype": dbt_utils.type_int()},
    {"name": "mergepaymentreq", "datatype": "boolean"},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "paymentnotify", "datatype": "boolean"},
    {"name": "personalinfo_companyname", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_contactname", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_email_1", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_firstname", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_lastname", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_address_1", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_address_2", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_city", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_country", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_countrycode", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_state", "datatype": dbt_utils.type_string()},
    {"name": "personalinfo_mailaddress_zip", "datatype": dbt_utils.type_int()},
    {"name": "personalinfo_printas", "datatype": dbt_utils.type_string()},
    {"name": "postactualcost", "datatype": "boolean"},
    {"name": "recordno", "datatype": dbt_utils.type_int()},
    {"name": "startdate", "datatype": "date"},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
