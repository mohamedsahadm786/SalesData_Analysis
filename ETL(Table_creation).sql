
--             CSV / API / Excel
                      ↓
--   STAGING TABLE   ← raw, dirty, flexible
                      ↓
--   TRANSFORM LOGIC ← validation + conversion
                      ↓
--  FINAL TABLE     ← clean, trusted, analytics-ready

--##################################################################

-- STEP 1: Create STAGING table (RAW DATA)

-- Rule: Everything = VARCHAR

CREATE TABLE sales_data_stage (
    order_number        VARCHAR,
    order_date          VARCHAR,  -- raw DD-MM-YYYY
    customer_name       VARCHAR,
    channel             VARCHAR,
    product_name        VARCHAR,
    quantity            VARCHAR,
    unit_price          VARCHAR,
    revenue             VARCHAR,
    cost                VARCHAR,
    state               VARCHAR,
    state_name          VARCHAR,
    us_region           VARCHAR,
    lat                 VARCHAR,
    lon                 VARCHAR,
    total_cost          VARCHAR,
    profit              VARCHAR,
    profit_margin_pct   VARCHAR,
    order_month_name    VARCHAR,
    order_month_num     VARCHAR,
    order_month         VARCHAR
);

-----------------------------------------------

SELECT * FROM sales_data_stage
-----------------------------------------------

-- STEP 2: Import CSV into staging table

-----------------------------------------------


--STEP 3: Create FINAL table (CLEAN DATA)
CREATE TABLE sales_data (
    order_number        VARCHAR,
    order_date          DATE,      -- clean DATE
    customer_name       VARCHAR,
    channel             VARCHAR,
    product_name        VARCHAR,
    quantity            INT,
    unit_price          NUMERIC,
    revenue             NUMERIC,
    cost                NUMERIC,
    state               VARCHAR,
    state_name          VARCHAR,
    us_region           VARCHAR,
    lat                 NUMERIC,
    lon                 NUMERIC,
    total_cost          NUMERIC,
    profit              NUMERIC,
    profit_margin_pct   NUMERIC,
    order_month_name    VARCHAR,
    order_month_num     INT,
    order_month         DATE
);



-- STEP 4: TRANSFORM + INSERT (MOST IMPORTANT PART)

INSERT INTO sales_data
SELECT
    order_number,
    TO_DATE(order_date, 'DD-MM-YYYY') AS order_date,
    customer_name,
    channel,
    product_name,
    quantity::INT,
    unit_price::NUMERIC,
    revenue::NUMERIC,
    cost::NUMERIC,
    state,
    state_name,
    us_region,
    lat::NUMERIC,
    lon::NUMERIC,
    total_cost::NUMERIC,
    profit::NUMERIC,
    profit_margin_pct::NUMERIC,
    order_month_name,
    order_month_num::INT,

    -- FIX for YYYY-MM format
    TO_DATE(order_month || '-01', 'YYYY-MM-DD') AS order_month

FROM sales_data_stage;

--------------------------------------------
SELECT * FROM sales_data LIMIT 10
--------------------------------------------


--- NOW DELETE THE STAGED TABLE ENTIRELY OR JUST TRUNCATE (Keep structure, remove data)

-- OPTION 1 (Recommended): Keep structure, remove data (Real world compnies use this method)
TRUNCATE TABLE sales_data_stage;

-- OPTION 2: Drop staging table completely (for toy project)
DROP TABLE IF EXISTS sales_data_stage;

