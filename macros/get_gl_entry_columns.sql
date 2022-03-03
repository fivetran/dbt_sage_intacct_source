23:00:53  [WARNING]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- models.develop.example

23:00:56  {% macro get_gl_entry_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accountkey", "datatype": dbt_utils.type_int()},
    {"name": "accountno", "datatype": dbt_utils.type_float()},
    {"name": "adj", "datatype": "boolean"},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "basecurr", "datatype": dbt_utils.type_string()},
    {"name": "batchno", "datatype": dbt_utils.type_string()},
    {"name": "billable", "datatype": "boolean"},
    {"name": "cf_h_record_number", "datatype": dbt_utils.type_int()},
    {"name": "cf_h_transaction_number", "datatype": dbt_utils.type_string()},
    {"name": "classdimkey", "datatype": dbt_utils.type_int()},
    {"name": "classid", "datatype": dbt_utils.type_string()},
    {"name": "classname", "datatype": dbt_utils.type_string()},
    {"name": "cleared", "datatype": dbt_utils.type_string()},
    {"name": "clrdate", "datatype": "date"},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "customerdimkey", "datatype": dbt_utils.type_int()},
    {"name": "customerid", "datatype": dbt_utils.type_string()},
    {"name": "customername", "datatype": dbt_utils.type_string()},
    {"name": "department", "datatype": dbt_utils.type_string()},
    {"name": "departmentkey", "datatype": dbt_utils.type_int()},
    {"name": "departmenttitle", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "document", "datatype": dbt_utils.type_string()},
    {"name": "employeedimkey", "datatype": dbt_utils.type_int()},
    {"name": "employeeid", "datatype": dbt_utils.type_string()},
    {"name": "employeename", "datatype": dbt_utils.type_string()},
    {"name": "entry_date", "datatype": "date"},
    {"name": "exch_rate_date", "datatype": "date"},
    {"name": "exchange_rate", "datatype": dbt_utils.type_int()},
    {"name": "itemdimkey", "datatype": dbt_utils.type_int()},
    {"name": "itemid", "datatype": dbt_utils.type_string()},
    {"name": "itemname", "datatype": dbt_utils.type_string()},
    {"name": "line_no", "datatype": dbt_utils.type_int()},
    {"name": "location", "datatype": dbt_utils.type_string()},
    {"name": "locationkey", "datatype": dbt_utils.type_int()},
    {"name": "locationname", "datatype": dbt_utils.type_string()},
    {"name": "modifiedby", "datatype": dbt_utils.type_int()},
    {"name": "projectdimkey", "datatype": dbt_utils.type_int()},
    {"name": "projectid", "datatype": dbt_utils.type_string()},
    {"name": "projectname", "datatype": dbt_utils.type_string()},
    {"name": "recon_date", "datatype": "date"},
    {"name": "recordno", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "tr_type", "datatype": dbt_utils.type_int()},
    {"name": "trx_amount", "datatype": dbt_utils.type_float()},
    {"name": "userno", "datatype": dbt_utils.type_int()},
    {"name": "vendordimkey", "datatype": dbt_utils.type_int()},
    {"name": "vendorid", "datatype": dbt_utils.type_string()},
    {"name": "vendorname", "datatype": dbt_utils.type_string()},
    {"name": "warehousedimkey", "datatype": dbt_utils.type_int()},
    {"name": "warehouseid", "datatype": dbt_utils.type_string()},
    {"name": "warehousename", "datatype": dbt_utils.type_string()},
    {"name": "whencreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "whenmodified", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
