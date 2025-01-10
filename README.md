<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_sage_intacct_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_,<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# Sage Intacct Source dbt Package ([Docs](https://fivetran.github.io/dbt_sage_intacct_source/))

## What does this dbt package do?
- Materializes [Sage Intacct staging tables](https://fivetran.github.io/dbt_sage_intacct_source/#!/overview/sage_intacct_source/models/?g_v=1&g_e=seeds) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/sage-intacct#schemainformation). These staging tables clean, test, and prepare your Sage Intacct data from [Fivetran's connector](https://fivetran.com/docs/applications/sage-intacct) for analysis by doing the following:
  - Names columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your sage_intacct data through the [dbt docs site](https://fivetran.github.io/dbt_sage_intacct_source/).
- These tables are designed to work simultaneously with our [Sage Intacct transformation package](https://github.com/fivetran/dbt_sage_intacct).
## How do I use the dbt package?
### Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Sage Intacct connection syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination.

#### Databricks Dispatch Configuration
If you are using a Databricks destination with this package you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Step 2: Install the package (skip if also using the `sage_intacct` transformation package)
If you are **not** using the [Sage Intacct transformation package](https://github.com/fivetran/dbt_sage_intacct), include the following sage_intacct_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/sage_intacct_source
    version: [">=0.3.0", "<0.4.0"] # we recommend using ranges to capture non-breaking changes automatically
```
### Step 3: Define database and schema variables
By default, this package runs using your destination and the `sage_intacct` schema. If this is not where your Sage Intacct data is (for example, if your Sage Intacct schema is named `sage_intacct_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    sage_intacct_database: your_database_name
    sage_intacct_schema: your_schema_name 
```
### (Optional) Step 4: Additional configurations

#### Passthrough Columns
This package allows users to add additional columns to the `stg_sage_intacct__gl_account` table.
Columns passed through must be present in the upstream source tables. See below for an example of how the passthrough columns should be configured within your `dbt_project.yml` file.

```yml
# dbt_project.yml

...
vars:
  sage_intacct_source:
    sage_account_pass_through_columns: ['new_custom_field', 'custom_field_2']
    sage_gl_pass_through_columns: ['custom_field_3', 'custom_field_4']
```

#### Disabling and Enabling Models

When setting up your Sage Intacct connection in Fivetran, it is possible that not every table this package expects will be synced. This can occur because you either don't use that functionality in Sage or have actively decided to not sync some tables. In order to disable the relevant functionality in the package, you will need to add the relevant variables.

By default, all variables are assumed to be `true`. You only need to add variables for the tables you would like to disable:

```yml
# dbt_project.yml

config-version: 2

vars:
    sage_intacct__using_invoices: false                 # default is true
    sage_intacct__using_bills: false                    # default is true
```


#### Change the Build Schema
By default, this package builds the Sage Intacct staging models within a schema titled (`<target_schema>` + `_stg_sage_intacct`) in your target database. If this is not where you would like your Sage Intacct staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
    sage_intacct_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

### (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for more details</summary>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
    
#### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_sage_intacct_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    sage_intacct_<default_source_table_name>_identifier: your_table_name
```

</details>

## How is this package maintained and can I contribute?
### Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/sage_intacct_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_sage_intacct_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Does this package have dependencies?
This dbt package is dependent on the following dbt packages. These dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package.

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_sage_intacct_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).