23:02:05  [WARNING]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- models.develop.example

23:02:08  {% macro get_gl_acct_grp_member_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "childname", "datatype": dbt_utils.type_string()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parentkey", "datatype": dbt_utils.type_int()},
    {"name": "recordno", "datatype": dbt_utils.type_string()},
    {"name": "sortord", "datatype": dbt_utils.type_int()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
