--Create Database And Schemas

CREATE DATABASE DataWarehouse;

USE DataWarehouse;
CREATE TABLE IF NOT EXISTS etl_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    batch_name VARCHAR(100),
    table_name VARCHAR(100),
    status VARCHAR(20),
    message TEXT,
    start_time DATETIME,
    end_time DATETIME,
    duration_seconds INT
);
ALTER TABLE datawarehouse.etl_log
ADD COLUMN rows_loaded INT AFTER status;

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
