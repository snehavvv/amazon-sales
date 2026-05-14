-- 1. Monthly revenue with MoM growth (window function — recruiter magnet)
SELECT
    d.year, d.month_name,
    SUM(f.sale_amount)                                          AS revenue,
    LAG(SUM(f.sale_amount)) OVER (ORDER BY d.year, d.month)    AS prev_month,
    ROUND(
        (SUM(f.sale_amount) - LAG(SUM(f.sale_amount)) OVER (ORDER BY d.year, d.month))
        / NULLIF(LAG(SUM(f.sale_amount)) OVER (ORDER BY d.year, d.month), 0) * 100, 2
    )                                                           AS mom_growth_pct
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
WHERE f.order_status = 'Delivered'
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;