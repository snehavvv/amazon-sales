-- 3. Vendor reconciliation (for your resume — shows business acumen)
SELECT
    s.seller_name, s.seller_type, s.fulfillment,
    COUNT(f.sale_id)         AS total_orders,
    SUM(f.sale_amount)       AS gross_revenue,
    SUM(f.shipping_cost)     AS total_shipping,
    AVG(f.discount)          AS avg_discount,
    SUM(CASE WHEN f.order_status = 'Returned' THEN 1 ELSE 0 END) AS returns,
    ROUND(
        SUM(CASE WHEN f.order_status = 'Returned' THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(f.sale_id) * 100, 2
    )                        AS return_rate_pct
FROM fact_sales f
JOIN dim_seller s ON f.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_name, s.seller_type, s.fulfillment
ORDER BY gross_revenue DESC;