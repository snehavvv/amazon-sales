# 📊 Amazon Sales Analytics — End-to-End Data Project

## 📝 Project Overview
This project demonstrates an end-to-end data analytics pipeline using Amazon sales data. It takes raw CSV exports and transforms them into a professional Star Schema, suitable for advanced BI reporting. The focus is on robust data modeling, automated Python-based ETL processes, and DAX-driven insights in Power BI.

## 🛠️ Technology Stack
- **Database / Data Modeling:** Star Schema (Fact and Dimension tables), SQLite, PostgreSQL
- **Data Engineering (ETL):** Python (`pandas`, `sqlalchemy`), automated data cleaning and schema inference
- **Business Intelligence:** Power BI, DAX (Time Intelligence, Ranking, Aggregations)
- **Reporting:** Excel automation via Python (`openpyxl`)

## 🏗️ Data Architecture (Star Schema)
To enable efficient and accurate BI reporting, a Star Schema was programmatically generated from the flat dataset:
- `fact_sales`: Transactional data including revenues and quantities.
- `dim_product`: Product metadata and descriptions.
- `dim_category`: Product categorizations.
- `dim_seller`: Vendor and seller information.
- `dim_date`: Comprehensive calendar definitions for Time Intelligence.
- `dim_geography`: Regional mappings.

## 📈 Key DAX Measures Implemented
- Revenue (YTD, QTD, MTD)
- Month-over-Month (MoM) Growth
- Profit Margins & Cost Analysis
- Top Product Rankings (RANKX)
- Rolling Averages

## 🚀 Setup Instructions
1. **Data Prep:** Run `python_cleaning/load_to_postgres.py` to generate the Star Schema CSVs from raw data.
2. **Analysis:** Review `notebooks/03_eda_analysis.ipynb` for exploratory data analysis.
3. **Power BI Dashboard:** Open the `.pbix` file, point the data sources to the generated `powerbi/*.csv` files, and refresh to analyze the newly modeled data.

## 🖼️ Dashboard Previews
*(See `screenshots/` folder for visual references of the reporting views)*
