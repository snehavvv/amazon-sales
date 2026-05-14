# Amazon Sales Analytics — End-to-End Data Project

## 🔍 Overview
End-to-end data analytics pipeline built on Amazon product sales 
data covering the complete analyst workflow — data cleaning, 
SQL modelling, exploratory data analysis, Power BI dashboard, 
and Excel reporting.

| Metric | Value |
|--------|-------|
| Total Records | 1,465 orders |
| Total Revenue | ₹4.58M |
| Total Profit | ₹1.36M |
| Unique Products | 1,351 |
| Categories | 10+ |
| Dashboard Pages | 4 |

## 🛠️ Tech Stack
| Tool | Purpose |
|------|---------|
| Python (pandas, plotly, seaborn) | Data cleaning & EDA |
| SQLite | Star schema database |
| SQL | Analytical queries |
| Power BI | Interactive dashboard |
| Excel + openpyxl | Reporting & vendor reconciliation |

## 💡 Key Findings
- Top 10 products drive 80% of total revenue (Pareto principle)
- Electronics dominates at 67% revenue share across all categories
- Discounts above 50% negatively correlate with profit margins
- Amazon Fulfilled has the lowest return rate vs FBA and FBM

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
│
├── screenshots/
│   ├── page1_executive.png
│   ├── page2_products.png
│   ├── page3_geo.png
│   └── page4_cover.png
│
└── README.md
```

## 🗄️ Database Schema
Star schema with 6 tables designed for Power BI performance:
fact_sales (1,465 records)
├── dim_product (1,351 products)
├── dim_date (730 dates)
├── dim_seller (3 seller types)
├── dim_geography (4 regions)
└── dim_category (10+ categories)
## 📈 Dashboard Pages
| Page | Content |
|------|---------|
| 🏠 Cover | Project overview and key stats |
| 📊 Executive Overview | Revenue KPIs, monthly trends, category performance |
| 🛍️ Product Deep Dive | Top 10 products, discount vs rating, category matrix |
| 🗺️ Geo & Seller Performance | Regional revenue, vendor scorecard, fulfillment split |

## 🔍 SQL Highlights
- Window functions for MoM growth calculation
- CTEs for regional running totals
- Vendor reconciliation with return rate flagging
- Star schema with 8 performance indexes

## 🚀 How to Run
1. Clone the repo
git clone https://github.com/snehavvv/amazon-sales.git
2. Install dependencies
pip install -r requirements.txt
3. Run data cleaning
notebooks/01_data_cleaning.ipynb
4. Build the database
python load_to_postgres.py
5. Run EDA
notebooks/03_eda_analysis.ipynb
6. Open dashboard
powerbi/amazon_dashboard.pbix

---
*Data Source: Kaggle — Amazon Sales Dataset*
*Tools: Python · SQL · SQLite · Power BI · Excel*