## SQL Data Warehouse ETL Project

This project implements a complete Data Warehouse pipeline using MySQL following a Bronze → Silver → Gold architecture.
It demonstrates Data Ingestion, Data Cleaning, Transformation, Standardization, and Data Modeling using SQL.

---
## 🏗️ Data Architecture
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:

 <img width="1543" height="911" alt="image" src="https://github.com/user-attachments/assets/b9e4e131-04f1-4439-b6ad-c1ac715adcaa" />

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
---
##📂 Repository Structure

```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.png                         #File shows all different techniquies and methods of ETL
│   ├── data_architecture.png           #File shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.png                   #File for the data flow diagram
│   ├── data_models.png                 #File for data models (star schema)
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
```
---
##🧠 Key Learnings

- ✔ Data Warehouse Architecture (Bronze → Silver → Gold)
- ✔ ETL Design in SQL
- ✔ Cleaning dirty date formats using STR_TO_DATE()
- ✔ Applying window functions like ROW_NUMBER() and LEAD()
- ✔ Fixing inconsistent product, gender, marital status values
- ✔ Using MySQL for analytical processing

---
