[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
# Sage Intacct (Source) 

This package models Sage Intacct data from [Fivetran's connector](https://fivetran.com/docs/applications/sage-intacct). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/sage-intacct/#schemainformation).

This package enriches your Fivetran data by doing the following:
- Adds descriptions to tables and columns that are synced using Fivetran
- Adds column-level testing where applicable. For example, all ID fields are tested for non-null values.
- Models staging tables, which will be used in our transform package
## Compatibility

> Please be aware that the [dbt_sage_intacct](https://github.com/fivetran/dbt_sage_intacct) and [dbt_sage_intacct_source](https://github.com/fivetran/dbt_sage_intacct_source) packages were developed with single-currency company data. As such, the package models will not reflect accurate totals if your account has multi-currency enabled. If multi-currency functionality is desired, we welcome discussion to support this in a future version. 

## Models
This package contains staging models, designed to work simultaneously with our [Sage Intacct transform package](https://github.com/fivetran/dbt_sage_intacct). The staging models are designed to:
- Remove any rows that are soft-deleted
- Name columns consistently across all packages:
    - Boolean fields are prefixed with `is_` or `has_`.
    - Timestamps are appended with `_at`.
    - ID primary keys are prefixed with the name of the table. For example, the `gl_detail` table's recordno column is renamed `gl_detail_id`.
    - Foreign keys include the table that they refer to. For example, ap_bill_item's `recordkey` is named `bill_id`. 

## Installation Instructions
Add the following configuration to your `packages.yml` file:
```yml
# packages.yml
packages:
  - package: fivetran/sage_intacct_source
    version: [">=0.1.0", "<0.2.0"]
```

Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
By default, this package looks for your Sage Intacct data in the `sage_intacct` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Sage Intacct data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
    sage_intacct_database: your_database_name
    sage_intacct_schema: your_schema_name 
```

### Passthrough Columns
This package allows users to add additional columns to the `stg_sage_intacct__gl_account` table. 
Columns passed through must be present in the upstream source tables. See below for an example of how the passthrough columns should be configured within your `dbt_project.yml` file.

```yml
# dbt_project.yml

...
vars:
  sage_intacct_source:
    sage_account_pass_through_columns: ['new_custom_field', 'custom_field_2']
```

### Disabling and Enabling Models

When setting up your Sage Intacct Source (Sage) connection in Fivetran, it is possible that not every table this package expects will be synced. This can occur because you either don't use that functionality in Sage or have actively decided to not sync some tables. In order to disable the relevant functionality in the package, you will need to add the relevant variables.

By default, all variables are assumed to be `true`. You only need to add variables for the tables you would like to disable:

```yml
# dbt_project.yml

config-version: 2

vars:
    sage_intacct__using_invoices: false                 # default is true
```


### Change the Build Schema
By default, this package builds the Sage Intacct staging models within a schema titled (<target_schema> + `_stg_sage_intacct`) in your target database. If this is not where you would like your Sage Intacct staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
    sage_intacct_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

## Contributions
Additional contributions to this package are very welcome! Please create issues
or open PRs against `main`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.


## Database Support

This package has been tested on Spark, BigQuery, Snowflake, Redshift, PostgreSQL, and Databricks.

### Databricks Dispatch Configuration
dbt `v0.20.0` introduced a new project-level dispatch configuration that enables an "override" setting for all dispatched macros. If you are using a Databricks destination with this package, you need to add the dispatch configuration below (or a variation of that configuration) within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.

```yml
# dbt_project.yml

dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```
## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions or feedback, or need help? Book a time during our office hours [here](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or shoot us an email at solutions@fivetran.com.
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate dbt transformations with Fivetran [here](https://fivetran.com/docs/transformations/dbt).
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
