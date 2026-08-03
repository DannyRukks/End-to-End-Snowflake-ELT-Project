# End-to-End Snowflake Sales ELT Pipeline with Amazon S3, Streams, Tasks & Power BI

### Overview

This project demonstrates the implementation of a modern ELT (Extract, Load, Transform) pipeline using Snowflake as the cloud data warehouse, Amazon S3 as the data source, and Power BI as the reporting platform.

The pipeline follows the Medallion Architecture (Bronze → Silver → Gold), enabling scalable, incremental, and automated data processing using Snowflake Streams, Stored Procedures, and Task Chaining.

This solution intentionally uses COPY INTO instead of Snowpipe to demonstrate scheduled batch ingestion and orchestration.

### Project Architecture
![Snowflake ELT Architecture](architecture/Snowflake_Architecture.png)

### Technology Stack
| Technology | Purpose |
|-----------|------------|
| Snowflake |	Cloud Data Warehouse |
| Amazon S3	| Source Data Storage |
| SQL	      | Data Transformation |
| Streams	  | Incremental Data Processing |
| Tasks	    | Workflow Orchestration |
| Stored Procedures	| Business Logic |
| COPY INTO	| Batch Data Ingestion |
| External Stage | Access S3 Files |
| Storage Integration |	Secure AWS Connection |
| Power BI	| Reporting & Visualization |
