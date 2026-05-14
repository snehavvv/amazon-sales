-- Dimension: Date (most important — build this first)
CREATE TABLE dim_date (
    date_id     SERIAL PRIMARY KEY,
    full_date   DATE NOT NULL UNIQUE,
    year        INT NOT NULL,
    quarter     INT NOT NULL,
    month       INT NOT NULL,
    month_name  VARCHAR(15) NOT NULL,
    week        INT NOT NULL,
    day_name    VARCHAR(10) NOT NULL,
    is_weekend  BOOLEAN DEFAULT FALSE,
    is_holiday  BOOLEAN DEFAULT FALSE
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(300) NOT NULL,
    category     VARCHAR(100) NOT NULL,
    sub_category VARCHAR(100),
    unit_price   NUMERIC(10,2) NOT NULL,
    cost_price   NUMERIC(10,2),
    brand        VARCHAR(100),
    asin         VARCHAR(20) UNIQUE
);

-- Dimension: Customer
CREATE TABLE dim_customer (
    customer_id   SERIAL PRIMARY KEY,
    customer_name VARCHAR(200) NOT NULL,
    segment       VARCHAR(50),      -- Consumer / Corporate / Home Office
    email         VARCHAR(200),
    loyalty_tier  VARCHAR(20)       -- Bronze / Silver / Gold / Prime
);

-- Dimension: Seller / Vendor
CREATE TABLE dim_seller (
    seller_id    SERIAL PRIMARY KEY,
    seller_name  VARCHAR(200) NOT NULL,
    seller_type  VARCHAR(50),       -- Amazon / Third-party FBA / FBM
    rating       NUMERIC(3,2),
    fulfillment  VARCHAR(20)        -- FBA / FBM / Amazon
);

-- Dimension: Geography
CREATE TABLE dim_geography (
    geo_id      SERIAL PRIMARY KEY,
    city        VARCHAR(100),
    state       VARCHAR(100),
    region      VARCHAR(50),        -- North / South / East / West
    country     VARCHAR(100) DEFAULT 'India',
    postal_code VARCHAR(20)
);

-- Fact Table (centre of the star)
CREATE TABLE fact_sales (
    sale_id       SERIAL PRIMARY KEY,
    product_id    INT NOT NULL REFERENCES dim_product(product_id),
    customer_id   INT NOT NULL REFERENCES dim_customer(customer_id),
    date_id       INT NOT NULL REFERENCES dim_date(date_id),
    seller_id     INT NOT NULL REFERENCES dim_seller(seller_id),
    geo_id        INT NOT NULL REFERENCES dim_geography(geo_id),
    order_id      VARCHAR(50),
    sale_amount   NUMERIC(12,2) NOT NULL,
    quantity      INT NOT NULL DEFAULT 1,
    discount      NUMERIC(5,4) DEFAULT 0,    -- stored as 0.15 = 15%
    profit        NUMERIC(12,2),
    shipping_cost NUMERIC(8,2) DEFAULT 0,
    order_status  VARCHAR(30),               -- Delivered / Returned / Cancelled
    created_at    TIMESTAMP DEFAULT NOW()
);