{% macro get_department_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "custtitle", "datatype": dbt_utils.type_string()},
    {"name": "departmentid", "datatype": dbt_utils.type_string()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "parentid", "datatype": dbt_utils.type_string()},
    {"name": "parentkey", "datatype": dbt_utils.type_int()},
    {"name": "recordno", "datatype": dbt_utils.type_int()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
