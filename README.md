# dbt-learn

## Intro
This is a small project to fill leisure time during holidays while also updating knowledge about tools currently widely used in the data field, particularly data warehousing. I have long wanted to try these tools but only recently had the chance to do so. I apologize for any shortcomings, and I welcome any suggestions.

## Pre-requisite 

**1. **Tools 
    * dbt
    * Postgresdb

**2. Installation
    **a. dbt
    You can refer to several sources for the installation process. In my case, I use DBT Core with the Postgres adapter. However, you should choose the adapter that best fits your specific needs and the data warehouse you are using. (Source: https://docs.getdbt.com/docs/core/pip-install#installing-the-adapter)

**3. Diagram
    * Used PostgreSQL as the database, storing raw data in the raw schema (raw layer). The data in the raw layer is processed into a data warehouse by cleansing and standardizing it, then loading it into dimension and fact tables in the staging layer. The data mart is created using the processed data from the data warehouse. All transformations are performed using dbt as the tool for data transformation.

    ![alt text](images.png)