-- Copy data from stage to bronze table using a stored procedure
USE DATABASE ORDER_DB;
USE SCHEMA BRONZE;

CREATE OR REPLACE PROCEDURE PROC_BRONZE_LOAD()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN

    COPY INTO CUSTOMER_ORDERS_RAW
    (
        ORDER_ID, CUSTOMER_NAME, ORDER_DATE, DELIVERY_DATE, ITEM_TYPE, QUANTITY,
        ORDER_STATUS, SHIPPING_METHOD, UNIT_PRICE, REGION, DISCOUNT, SOURCE_FILE_NAME,
        LOAD_TIMESTAMP
    )
    FROM
    (
        SELECT
            $1::NUMBER,
            $2::STRING,
            TO_DATE($3,'MM/DD/YYYY'),
            TO_DATE($4,'MM/DD/YYYY'),
            $5::STRING,
            $6::NUMBER,
            $7::STRING,
            $8::STRING,
            $9::NUMBER(10,2),
            $10::STRING,
            $11::NUMBER(5,2),
            METADATA$FILENAME,
            CURRENT_TIMESTAMP()
        FROM @ORDER_STAGE
    )
    FILE_FORMAT = (FORMAT_NAME = CSV_FILE_FORMAT)
    ON_ERROR = 'CONTINUE';

    RETURN 'Bronze load completed successfully.';

END;
$$;

