# Amazon Sales Analytics — End-to-End Data Project

## Overview
End-to-end analytics pipeline on 100K+ Amazon sales records covering
data cleaning, SQL modelling, EDA, Power BI dashboard, and Excel reporting.

## Tech stack
Python · PostgreSQL · Power BI · Excel · pandas · plotly · openpyxl

## Live dashboard
[View Power BI Dashboard →](your-published-link-here)

## Key findings
- Top 3 categories drive 67% of total revenue (Pareto analysis)
- Vendors with >10% return rate identified — potential ₹X,XX,000 revenue risk
- North region leads margin % despite lower order volume
- 15% average discount threshold beyond which profit turns negative

## Project structure
```text
amazon-sales-analytics/
│
├── dataset/
│   ├── amazon_sales_raw.csv
│   └── amazon_sales_cleaned.csv
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   └── 03_eda_analysis.ipynb
│
├── sql_queries/
│   ├── 01_create_schema.sql
│   ├── 02_create_indexes.sql
│   ├── 03_monthly_revenue_mom.sql
│   ├── 04_top_products_margin.sql
│   ├── 05_vendor_reconciliation.sql
│   └── 06_regional_performance.sql
│
├── powerbi/
│   ├── amazon_dashboard.pbix
│   ├── dax_measures.txt
│   └── dashboard_preview.pdf
│
├── excel/
│   └── amazon_sales_report.xlsx
│
├── charts/
│   ├── 01_monthly_revenue.html
│   ├── 02_category_treemap.html
│   ├── 03_margin_heatmap.png
│   ├── 04_pareto_skus.png
│   ├── 05_discount_vs_profit.html
│   ├── 06_geo_revenue.html
│   └── 07_vendor_matrix.html
│
├── screenshots/
│   ├── page1_executive.png
│   ├── page2_products.png
│   ├── page3_geo.png
│   └── page4_cover.png
│
└── README.md
```

## How to run
1. `pip install -r requirements.txt`
2. Run `python_cleaning/phase2_cleaning.ipynb`
3. Execute `sql_queries/01_create_schema.sql` in PostgreSQL
4. Run `notebooks/03_eda_analysis.ipynb`
5. Run `notebooks/04_excel_reporting.ipynb`
6. Open `powerbi/amazon_dashboard.pbix`
