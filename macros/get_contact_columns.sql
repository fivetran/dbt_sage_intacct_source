{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "cellphone", "datatype": dbt_utils.type_string()},
    {"name": "companyname", "datatype": dbt_utils.type_string()},
    {"name": "contactname", "datatype": dbt_utils.type_string()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "email_1", "datatype": dbt_utils.type_string()},
    {"name": "email_2", "datatype": dbt_utils.type_string()},
    {"name": "fax", "datatype": dbt_utils.type_string()},
    {"name": "firstname", "datatype": dbt_utils.type_string()},
    {"name": "initial", "datatype": dbt_utils.type_string()},
    {"name": "lastname", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_address_1", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_address_2", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_city", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_country", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_countrycode", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_state", "datatype": dbt_utils.type_string()},
    {"name": "mailaddress_zip", "datatype": dbt_utils.type_string()},
    {"name": "megaentityid", "datatype": dbt_utils.type_string()},
    {"name": "megaentitykey", "datatype": dbt_utils.type_int()},
    {"name": "megaentityname", "datatype": dbt_utils.type_string()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "pager", "datatype": dbt_utils.type_string()},
    {"name": "phone_1", "datatype": dbt_utils.type_string()},
    {"name": "phone_2", "datatype": dbt_utils.type_string()},
    {"name": "prefix", "datatype": dbt_utils.type_string()},
    {"name": "printas", "datatype": dbt_utils.type_string()},
    {"name": "recordno", "datatype": dbt_utils.type_int()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "taxable", "datatype": "boolean"},
    {"name": "taxid", "datatype": dbt_utils.type_string()},
    {"name": "url_1", "datatype": dbt_utils.type_string()},
    {"name": "url_2", "datatype": dbt_utils.type_string()},
    {"name": "visible", "datatype": "boolean"},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
