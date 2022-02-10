{% macro get_company_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "address_1", "datatype": dbt_utils.type_string()},
    {"name": "address_2", "datatype": dbt_utils.type_string()},
    {"name": "admin_user_key", "datatype": dbt_utils.type_int()},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "contactemail", "datatype": dbt_utils.type_string()},
    {"name": "contactname", "datatype": dbt_utils.type_string()},
    {"name": "contactphone", "datatype": dbt_utils.type_string()},
    {"name": "contractcustomerid", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "countrycode", "datatype": dbt_utils.type_string()},
    {"name": "created", "datatype": "date"},
    {"name": "legaladdress_1", "datatype": dbt_utils.type_string()},
    {"name": "legaladdress_2", "datatype": dbt_utils.type_string()},
    {"name": "legalcity", "datatype": dbt_utils.type_string()},
    {"name": "legalcountry", "datatype": dbt_utils.type_string()},
    {"name": "legalcountrycode", "datatype": dbt_utils.type_string()},
    {"name": "legalname", "datatype": dbt_utils.type_string()},
    {"name": "legalstate", "datatype": dbt_utils.type_string()},
    {"name": "legalzipcode", "datatype": dbt_utils.type_int()},
    {"name": "logo", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "ordercustomerid", "datatype": dbt_utils.type_string()},
    {"name": "recordno", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "zipcode", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
