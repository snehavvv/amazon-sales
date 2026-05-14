-- Indexes on all FK columns in fact table (critical for join performance)
CREATE INDEX idx_fact_product    ON fact_sales(product_id);
CREATE INDEX idx_fact_customer   ON fact_sales(customer_id);
CREATE INDEX idx_fact_date       ON fact_sales(date_id);
CREATE INDEX idx_fact_seller     ON fact_sales(seller_id);
CREATE INDEX idx_fact_geo        ON fact_sales(geo_id);

-- Composite index for time-series analysis (most common query pattern)
CREATE INDEX idx_fact_date_product ON fact_sales(date_id, product_id);

-- Partial index — only delivered orders (filters out noise in most KPI queries)
CREATE INDEX idx_fact_delivered ON fact_sales(date_id, sale_amount)
    WHERE order_status = 'Delivered';

-- Dim table indexes
CREATE INDEX idx_product_category ON dim_product(category, sub_category);
CREATE INDEX idx_geo_state        ON dim_geography(state, region);
CREATE INDEX idx_date_year_month  ON dim_date(year, month);