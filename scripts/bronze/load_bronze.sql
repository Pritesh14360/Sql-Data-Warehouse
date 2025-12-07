
===============================================================================
 Load Bronze Layer (Source -> Bronze)
===============================================================================


SET GLOBAL local_infile = 1;

SET @batch_name := 'bronze_layer';
SET @batch_start := NOW();


/************************************************
CRM: CUST INFO
************************************************/
SET @start := NOW();
SET @warn := NULL;

TRUNCATE TABLE bronze.crm_cust_info;

LOAD DATA LOCAL INFILE '/Users/priteshpatil/Downloads/sql-data-warehouse-project-main/datasets/source_crm/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Capture values
SET @end := NOW();
SET @rows_loaded := ROW_COUNT();

-- WARNINGS (manual user feedback)
SHOW WARNINGS;
SET @warn = CONCAT('Warnings: ', @@warning_count);

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name, 'crm_cust_info',
    CASE WHEN @rows_loaded = 0 THEN 'FAILED' ELSE 'SUCCESS' END,
    @rows_loaded,
    @warn,
    @start, @end, TIMESTAMPDIFF(SECOND, @start, @end)
);



/************************************************
CRM: PRODUCT INFO
************************************************/
SET @start := NOW();
SET @warn := NULL;

TRUNCATE TABLE bronze.crm_prd_info;

LOAD DATA LOCAL INFILE '/Users/priteshpatil/Downloads/sql-data-warehouse-project-main/datasets/source_crm/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @end := NOW();
SET @rows_loaded := ROW_COUNT();

SHOW WARNINGS;
SET @warn = CONCAT('Warnings: ', @@warning_count);

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name, 'crm_prd_info',
    CASE WHEN @rows_loaded = 0 THEN 'FAILED' ELSE 'SUCCESS' END,
    @rows_loaded,
    @warn,
    @start, @end, TIMESTAMPDIFF(SECOND, @start, @end)
);



/************************************************
CRM: SALES DETAILS
************************************************/
SET @start := NOW();
SET @warn := NULL;

TRUNCATE TABLE bronze.crm_sales_details;

LOAD DATA LOCAL INFILE '/Users/priteshpatil/Downloads/sql-data-warehouse-project-main/datasets/source_crm/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @end := NOW();
SET @rows_loaded := ROW_COUNT();

SHOW WARNINGS;
SET @warn = CONCAT('Warnings: ', @@warning_count);

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name, 'crm_sales_details',
    CASE WHEN @rows_loaded = 0 THEN 'FAILED' ELSE 'SUCCESS' END,
    @rows_loaded,
    @warn,
    @start, @end, TIMESTAMPDIFF(SECOND, @start, @end)
);



/************************************************
ERP: LOC A101
************************************************/
SET @start := NOW();
SET @warn := NULL;

TRUNCATE TABLE bronze.erp_loc_a101;

LOAD DATA LOCAL INFILE '/Users/priteshpatil/Downloads/sql-data-warehouse-project-main/datasets/source_erp/loc_a101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @end := NOW();
SET @rows_loaded := ROW_COUNT();

SHOW WARNINGS;
SET @warn = CONCAT('Warnings: ', @@warning_count);

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name, 'erp_loc_a101',
    CASE WHEN @rows_loaded = 0 THEN 'FAILED' ELSE 'SUCCESS' END,
    @rows_loaded,
    @warn,
    @start, @end, TIMESTAMPDIFF(SECOND, @start, @end)
);



/************************************************
ERP: CUST AZ12
************************************************/
SET @start := NOW();
SET @warn := NULL;

TRUNCATE TABLE bronze.erp_cust_az12;

LOAD DATA LOCAL INFILE '/Users/priteshpatil/Downloads/sql-data-warehouse-project-main/datasets/source_erp/cust_az12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @end := NOW();
SET @rows_loaded := ROW_COUNT();

SHOW WARNINGS;
SET @warn = CONCAT('Warnings: ', @@warning_count);

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name, 'erp_cust_az12',
    CASE WHEN @rows_loaded = 0 THEN 'FAILED' ELSE 'SUCCESS' END,
    @rows_loaded,
    @warn,
    @start, @end, TIMESTAMPDIFF(SECOND, @start, @end)
);



/************************************************
ERP: PX CAT G1V2
************************************************/
SET @start := NOW();
SET @warn := NULL;

TRUNCATE TABLE bronze.erp_px_cat_g1v2;

LOAD DATA LOCAL INFILE '/Users/priteshpatil/Downloads/sql-data-warehouse-project-main/datasets/source_erp/px_cat_g1v2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @end := NOW();
SET @rows_loaded := ROW_COUNT();

SHOW WARNINGS;
SET @warn = CONCAT('Warnings: ', @@warning_count);

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name, 'erp_px_cat_g1v2',
    CASE WHEN @rows_loaded = 0 THEN 'FAILED' ELSE 'SUCCESS' END,
    @rows_loaded,
    @warn,
    @start, @end, TIMESTAMPDIFF(SECOND, @start, @end)
);



/************************************************
BATCH COMPLETE
************************************************/
SET @batch_end := NOW();

INSERT INTO datawarehouse.etl_log
(batch_name, table_name, status, rows_loaded, message, start_time, end_time, duration_seconds)
VALUES (
    @batch_name,
    'FULL_BATCH',
    'COMPLETED',
    NULL,
    'Bronze layer ETL completed',
    @batch_start,
    @batch_end,
    TIMESTAMPDIFF(SECOND, @batch_start, @batch_end)
);
