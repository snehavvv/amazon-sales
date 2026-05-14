-- 4. Regional performance with running total (CTE + window)
WITH regional_sales AS (
    SELECT
        g.region, g.state,
        SUM(f.sale_amount) AS revenue
    FROM fact_sales f
    JOIN dim_geography g ON f.geo_id = g.geo_id
    WHERE f.order_status = 'Delivered'
    GROUP BY g.region, g.state
)
SELECT *,
    SUM(revenue) OVER (PARTITION BY region ORDER BY revenue DESC) AS running_total,
    ROUND(revenue / SUM(revenue) OVER (PARTITION BY region) * 100, 1) AS pct_of_region
FROM regional_sales
ORDER BY region, revenue DESC;