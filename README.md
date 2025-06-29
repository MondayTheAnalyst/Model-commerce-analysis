
# 📦 Model Commerce Sales Analysis (SQL + Excel Project)

A business-focused data analytics project using SQL and Excel to explore customer behavior, sales patterns, and operational risks for a fictional e-commerce company. This analysis was designed to answer real-world commercial questions with data-backed insights.

---

## 🚀 Summary

- **Tools Used:** SQL Server, Microsoft Excel
- **Key Focus Areas:** Product Profitability, Customer Segmentation, Purchase Behavior, Operational Delays, and Sales Geography
- **Outputs:** SQL Queries, Views for BI Tools, Excel Pivot Dashboards

---

## 🔧 Tech Stack

| Component        | Purpose                                |
|------------------|----------------------------------------|
| SQL Server       | Data cleaning, transformation & querying |
| Excel            | Visual reporting, pivot charts & KPIs  |


---


## 📁 Repository Structure

- `SQL_Scripts/`
  - `SQL_DDL.sql` — SQL Server-compatible Database and table creation script
  - `SQL_DML.sql` — Main analysis logic answering 6 business questions
  - `Tables_tests.sql` — Sample select queries for validation
  - `_Views.sql` — Reusable SQL views for Excel/BI exports
- `Model_Commerce_Insights.xlsx` — Visualizations, pivot tables, segment charts
- `README.md` — Project documentation and analysis insights


---

## ❓ Business Questions Solved

1. **🧮 Revenue & Profitability Breakdown** — Which products and regions drive revenue?
2. **📦 Product Affinities** — What items are frequently (or rarely) purchased together?
3. **💳 Customer Segments by Credit Limit** — Does credit access influence spending?
4. **🔁 Repeat Purchase Behavior** — Are returning customers increasing order value?
5. **🌍 Geographic Mapping** — Where are customers relative to their sales offices?
6. **🚚 Late Deliveries Detection** — What orders risk exceeding delivery SLAs?

---

## 📊 Excel Visualizations

- Pivot charts for **Top/Bottom Products**
- **Sales Heatmaps** across regions & product lines
- **Customer Lifecycle Tracking** using repeat order metrics
- **Late Order Flags** with qualitative comments on delays
- Segmentation charts for **credit limit groups vs. sales volume**

---

## 📌 Key Insights & Recommendations

### 🛒 Product Strategy
- Top 3 products generate ~50% profit — focus marketing on high-end collectibles.
- Discontinue underperformers or test new pricing models for low-movers.

### 🔁 Customer Engagement
- Loyal buyers spike after 7th and 12th purchases — automate lifecycle nudges here.
- Low-credit users show potential if offered bundle deals or micro-purchases.

### 🚚 Operational Optimization
- All weather-delayed orders show a ≥3-day lag — many due to credit holds or courier preferences.
- Suggest adding delay reason flags in order tracking to improve logistics efficiency.

### 🌍 Geographic Opportunity
- USA, France & Belgium are top 3 markets — consider regional expansion strategies.
- Australia & New Zealand: high AOV with moderate volume = growth opportunity.

---

## 📥 How to Use

1. Run SQL setup via `SQL_DDL.sql`
2. Execute business logic queries in `SQL_DML.sql`
3. Optional: Use `Views.sql` to create BI-ready views
4. Open `Model_Commerce_Insights.xlsx` for summarized visual reports

---

## 🧠 Learning Outcome

This project demonstrates how a data analyst can combine SQL and Excel to derive actionable business insights — from customer segmentation to operational gaps — using a structured approach to solving commercial problems.
