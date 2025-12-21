# 📊 Regional Sales Analysis  
### End-to-End Data Analytics & Business Intelligence Project

---

## 🧠 Project Overview

Sales organizations often face **uneven regional performance**, **unclear seasonal demand patterns**, and **limited visibility into product, customer, and channel profitability**.  
This project delivers a **data-driven regional sales intelligence solution** by analyzing **5 years of U.S. sales data** and converting it into **actionable business insights** through **Exploratory Data Analysis (EDA)** and an **interactive Power BI dashboard**.

The objective is to **identify growth levers, optimize pricing and channel strategies, and support data-driven decision-making** at both operational and strategic levels.

---

## 🎯 Business Problem Statement

- Inconsistent revenue and profit performance across U.S. regions  
- Limited visibility into:
  - Seasonal sales fluctuations  
  - High-impact and low-performing SKUs  
  - Channel-wise profitability  
  - Customer revenue concentration  
- Fragmented datasets with no predefined relationships  

### Business Question
> How can historical sales data be leveraged to uncover regional trends, profitability drivers, and strategic opportunities to improve overall business performance?

---

## 🛠️ Solution Approach

This project follows a **two-phase analytical framework**:

### 1️⃣ Exploratory Data Analysis (EDA)
- Analyze historical sales data to identify trends, patterns, and anomalies  
- Understand relationships between products, customers, channels, and regions  
- Build a strong analytical foundation for business recommendations  

### 2️⃣ Interactive Dashboarding
- Design a **self-service Power BI dashboard** for business users  
- Enable ad-hoc analysis by:
  - Time
  - Product
  - Region
  - State
  - Sales channel  
- Translate analytical insights into **decision-ready visuals**

---

## 🔄 Project Workflow

```text
Raw Data
   ↓
Data Cleaning & Pre-processing
   ↓
Feature Engineering
   ↓
Exploratory Data Analysis (EDA)
   ↓
Business Insights
   ↓
Strategic Recommendations
   ↓
Interactive Power BI Dashboard
```

## 🧾 Data Overview

### Raw Data Characteristics
- Sales, customers, products, regions, states, and budgets stored in **separate unlinked tables**
- No predefined relationships between datasets
- Required extensive preprocessing before analysis

### Data Pre-processing & Feature Engineering
- Merged all datasets into a unified analytical model  
- Standardized column names and formats  
- Removed redundant attributes  
- Engineered new features:
  - `profit`
  - `profit_margin_pct`
  - calendar attributes (month name, month number, year)  
- **No missing values or duplicate records** found  

---

## 🧩 Final Dataset Structure

### Feature Categories

**Identifiers**
- `order_number`, `order_date`, `customer_name`, `product_name`, `channel`

**Financial Metrics**
- `quantity`, `unit_price`, `revenue`, `cost`, `profit`, `profit_margin_pct`

**Time Attributes**
- `order_month`, `order_month_num`, `order_year`

**Geographic Attributes**
- `state_code`, `state_name`, `us_region`, `latitude`, `longitude`

**Planning Data**
- `budget (2017)`

---

## 📈 Exploratory Data Analysis Highlights

### 🔹 Sales Trends
- Stable annual revenue cycle between **$24M–$26M**
- Seasonal peaks observed during **May–June**
- Lowest revenue levels recorded in **January**
- Significant revenue dip detected in early 2017 (outlier)

### 🔹 Product Performance
- **Products 26 and 25** contribute approximately **25% of total revenue**
- Mid-tier products show consistent revenue potential
- Bottom-performing SKUs identified for pricing or portfolio review

### 🔹 Channel Performance
- **Wholesale:** 54.1% of total sales volume  
- **Distributor:** 31.3%  
- **Export:** 14.6% with the **highest average profit margins**

### 🔹 Geographic Insights
- **California** leads in both revenue and order volume
- **West region** demonstrates the strongest overall market presence
- **Northeast region** underperforms, indicating expansion opportunities

### 🔹 Customer Segmentation
- Revenue is highly concentrated among top customers
- Uniform **35–40% margins** indicate strong pricing control
- High-revenue but low-margin customers flagged for contract optimization

### 🔹 Correlation Analysis
- `unit_price` is the strongest driver of:
  - revenue (0.91)
  - profit (0.79)
- `quantity` has limited impact on profitability
- Margin improvement is primarily driven by **pricing strategy**

---

## 🔑 Key Business Insights

- Strong **seasonality**, with revenue softness during Q1  
- High **SKU concentration risk**, with top products dominating revenue  
- Export channel delivers superior margins despite lower volume  
- California alone contributes a disproportionate share of revenue and orders  
- Customer revenue distribution is significantly skewed  

---

## 💡 Strategic Recommendations

- **Seasonality Management:**  
  Introduce targeted campaigns during low-performing months and amplify peak-season promotions  

- **SKU Optimization:**  
  Focus investment on high-performing products and re-evaluate low-margin SKUs  

- **Channel Strategy:**  
  Expand Export partnerships for margin growth while optimizing Wholesale volume incentives  

- **Regional Expansion:**  
  Replicate California’s success model across underperforming regions  

- **Margin Monitoring:**  
  Proactively flag low-margin orders and investigate cost drivers  

---

## 📊 Dashboard Overview (Power BI)

The Power BI dashboard enables:
- Executive performance summaries  
- Customer segmentation analysis  
- Revenue and margin scenario evaluation  
- Drill-down insights by region, state, product, and channel  

Designed for **self-service analytics and strategic planning**.

---

## 🧠 Business Impact

- Converts raw historical data into **decision-ready insights**
- Supports:
  - sales strategy
  - pricing optimization
  - channel planning
  - regional investment decisions  
- Enables stakeholders to onboard new datasets seamlessly  

---

## 🧰 Tools & Technologies

- **Programming:** Python  
- **Data Analysis:** Pandas, NumPy  
- **Visualization:** Matplotlib, Seaborn  
- **Business Intelligence:** Power BI  
- **Data Handling:** Excel, CSV  

---

## 🚀 Future Enhancements

- Sales and demand forecasting models  
- Automated KPI alerts and monitoring  
- Customer lifetime value (CLV) analysis  
- Cloud data warehouse integration  
- Advanced scenario simulation using machine learning  

---

## 📌 Conclusion

This project demonstrates a **complete analytics lifecycle** — from raw data preparation to executive dashboards — delivering **scalable, data-driven insights for real-world business decision-making**.

