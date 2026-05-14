-- 2. Top 10 products by profit margin
SELECT
    p.product_name, p.category,
    SUM(f.profit)                                AS total_profit,
    SUM(f.sale_amount)                           AS total_revenue,
    ROUND(SUM(f.profit)/SUM(f.sale_amount)*100, 2) AS margin_pct
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
WHERE f.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY margin_pct DESC
LIMIT 10;