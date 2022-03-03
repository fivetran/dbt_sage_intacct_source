23:01:54  [WARNING]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- models.develop.example

23:01:57  {% macro get_gl_acct_grp_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "acctgroupmanager", "datatype": dbt_utils.type_string()},
    {"name": "asof", "datatype": dbt_utils.type_string()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "dbcr", "datatype": dbt_utils.type_string()},
    {"name": "filterclass", "datatype": dbt_utils.type_string()},
    {"name": "filtercustomer", "datatype": dbt_utils.type_string()},
    {"name": "filterdept", "datatype": dbt_utils.type_string()},
    {"name": "filteremployee", "datatype": dbt_utils.type_string()},
    {"name": "filteritem", "datatype": dbt_utils.type_string()},
    {"name": "filterloc", "datatype": dbt_utils.type_string()},
    {"name": "filterproject", "datatype": dbt_utils.type_string()},
    {"name": "filtervendor", "datatype": dbt_utils.type_string()},
    {"name": "filterwarehouse", "datatype": dbt_utils.type_string()},
    {"name": "glacctgrppurposeid", "datatype": dbt_utils.type_string()},
    {"name": "includechildamt", "datatype": "boolean"},
    {"name": "iskpi", "datatype": "boolean"},
    {"name": "itemdimkey", "datatype": dbt_utils.type_int()},
    {"name": "itemid", "datatype": dbt_utils.type_string()},
    {"name": "itemname", "datatype": dbt_utils.type_string()},
    {"name": "membertype", "datatype": dbt_utils.type_string()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "normal_balance", "datatype": dbt_utils.type_string()},
    {"name": "recordno", "datatype": dbt_utils.type_int()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "totaltitle", "datatype": dbt_utils.type_string()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
