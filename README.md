# Model-commerce-analysis

# 📦 Model Commerce Sales Analysis (SQL + Excel Project)

A business-focused data analytics project exploring customer behavior, product performance, and sales trends using SQL and Excel. The project answers real-world business questions with data-driven logic and visual insights.

This project showcases how SQL can power critical business analysis and how Excel can help visualize the results in a clear, impactful way.

---

## 📌 Table of Contents

- [Overview](#overview)
- [Dataset & Schema](#dataset--schema)
- [Data Preparation](#data-preparation)
- [Business Questions Answered](#business-questions-answered)
- [Excel Insights & Visualizations](#excel-insights--visualizations)
- [Key Takeaways](#key-takeaways)


---

## 🧭 Overview

This project analyzes a fictional commercial sales dataset to:
- Understand what drives revenue and profit
- Explore customer purchasing behavior
- Detect shipping delays
- Segment customers by financial characteristics

---

## 🗃️ Dataset & Schema

The database includes tables on:
- Customers, Orders, OrderDetails
- Products, Product Lines
- Payments, Employees, Offices

Files used:
- `Raw_Script_for_Model_Commerce.txt`: MySQL schema
- `Tables_Creation_Cleaned.sql`: Converted for SQL Server
- `Model_Commerce_queries.sql`: SQL logic and analysis queries
- `Model_Commerce_Insights.xlsx`: Excel-based summary visuals

---

## 🧹 Data Preparation

- Removed MySQL-only syntax (`ENGINE=`, `CHARSET`, backticks)
- Converted `AUTO_INCREMENT` → `IDENTITY(1,1)` for SQL Server
- Adjusted data types (`int(11)` → `INT`, decimal compatibility)
- Cleaned and formatted `INSERT` statements
- Imported results into Excel for pivoting and visuals

---

## ❓ Business Questions Answered

1. What products and regions generated the most profit?
2. Which product lines are frequently bought together?
3. How do sales vary by customer credit limit?
4. Do repeat customers spend more or less over time?
5. How are customers geographically linked to sales offices?
6. Which shipments would be delayed if weather caused a 3-day hold?

---

## 📊 Excel Insights & Visualizations

- **Top & bottom product performers** by sales and profit
- **Profitability heatmaps** and product bundling patterns
- **Customer segmentation** by credit band
- **Repeat purchase behavior** lifecycle tracking
- **Delay detection** with qualitative comment analysis
- **Regional sales** (e.g., USA, France, Belgium leading)

---

## 🧾 Key Takeaways

This analysis uncovered critical business insights across customer behavior, product performance, and operational efficiency:

### 🛒 **Product & Sales Insights**
- **Sales are highly concentrated**: A small set of high-end products (like *Ferrari 360 Spider red*, *Ferrari Enzo*, and *Harley-Davidson models*) account for a significant portion of revenue and profit — confirming the **Pareto Principle (80/20 rule)**.
- **Low-performing products** like *Chevrolet Deluxe Coupe* and *Ducati 996 R* may require pricing adjustments, repositioning, or discontinuation due to low returns.

### 🔁 **product lines are frequently bought together & Customer Affinity**
- Strong co-purchase patterns exist among **Classic Cars**, **Vintage Cars**, and **Trucks & Buses**, indicating a shared buyer segment — likely collectors or enthusiasts.
- Categories like **Motorcycles** and **Planes** were often purchased in isolation, suggesting different audience segments and possibly requiring unique marketing approaches.
- These findings can inform **cross-sell strategies, product bundling, and personalized recommendations**.

### 💳 **Customer Segmentation by Credit Limit**
- Customers in the **\$75k–\$100k credit range** generated the highest total revenue, while those in the **\$100k–\$150k range** placed the **highest-value orders**.
- **Low credit customers (< \$75k)** still contributed meaningfully but tend to make smaller purchases. These users may benefit from **credit upgrades** or **smaller product bundles**.
- Interestingly, **high-credit customers (> \$150k)** spent less overall, suggesting that credit capacity alone does not equate to purchasing power — they may be niche clients or require more strategic engagement.

### 📈 **Repeat Purchase Behavior**
- While average value declined after the 2nd order, spikes in **7th, 12th, and 15th purchases** suggest that **loyalty builds over time** — potentially as customers gain trust or develop deeper needs.
- Late-stage drops in purchase value highlight the need for **lifecycle marketing interventions** to re-engage users and sustain order value.

### 🚚 **Delivery Delays & Operational Bottlenecks**
- All identified orders exceeded the required delivery window by at least three days (based on a hypothetical weather delay), exposing vulnerabilities in fulfillment timing.
- Comment analysis revealed that **many delays were not purely logistical**:
  - Credit holds
  - Customer shipping preferences (e.g., “DHL requested”)
  - Special handling or packaging requests
- This presents an opportunity to **tag and track delay reasons** for operational process improvements.

### 🌍 **Geographic Sales Distribution**
- The **USA dominates with over \$3 million in revenue**, followed by **France and Belgium** — making them top focus markets.
- Underperforming regions like **Hong Kong, Ireland, and the Philippines** might require strategic reevaluation or targeted market development.
- Offices in regions with high average order values (like **Australia and New Zealand**) present opportunities for growth with the right support.

---
## 🌸 Conclusion

This project demonstrates how SQL combined with Excel can generate actionable insights from a well-structured business dataset. It reveals how data modeling and query optimization can be used to answer real-world business questions and support decision-making across marketing, finance, logistics, and operations.

---

📬 For questions, feel free to reach out via [obotmonday680@gmail.com].
