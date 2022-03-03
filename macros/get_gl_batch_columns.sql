23:00:47  [WARNING]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- models.develop.example

23:00:50  {% macro get_gl_batch_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "baselocation", "datatype": dbt_utils.type_int()},
    {"name": "baselocation_no", "datatype": dbt_utils.type_string()},
    {"name": "batch_date", "datatype": "date"},
    {"name": "batch_title", "datatype": dbt_utils.type_string()},
    {"name": "batchno", "datatype": dbt_utils.type_int()},
    {"name": "cf_h_record_number_header", "datatype": dbt_utils.type_string()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "journal", "datatype": dbt_utils.type_string()},
    {"name": "megaentityid", "datatype": dbt_utils.type_string()},
    {"name": "megaentitykey", "datatype": dbt_utils.type_int()},
    {"name": "megaentityname", "datatype": dbt_utils.type_string()},
    {"name": "modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "modifiedbyid", "datatype": dbt_utils.type_string()},
    {"name": "module", "datatype": dbt_utils.type_string()},
    {"name": "prbatchkey", "datatype": dbt_utils.type_int()},
    {"name": "recordno", "datatype": dbt_utils.type_string()},
    {"name": "referenceno", "datatype": dbt_utils.type_string()},
    {"name": "reversed", "datatype": "date"},
    {"name": "reversedfrom", "datatype": "date"},
    {"name": "reversedkey", "datatype": dbt_utils.type_int()},
    {"name": "schopkey", "datatype": dbt_utils.type_int()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "taximplications", "datatype": dbt_utils.type_string()},
    {"name": "userinfo_loginid", "datatype": dbt_utils.type_string()},
    {"name": "userkey", "datatype": dbt_utils.type_int()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
