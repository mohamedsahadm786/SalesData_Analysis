# 📊 Regional Sales Analytics – End-to-End Business Intelligence Project

## 📌 Project Overview
This project delivers an **end-to-end sales analytics solution** using **Python, PostgreSQL (SQL), and Power BI** to analyze **multi-year U.S. regional sales data**.  
It focuses on solving **real-world business problems** related to revenue performance, profitability, customer concentration risk, channel efficiency, and seasonality.

The project is designed to reflect **industry-grade analytics workflows** commonly used in **data analyst, business analyst, and analytics engineer roles**.

---

## 🎯 Business Problem Statement
Organizations often struggle with:
- Uneven revenue and profit performance across regions
- Limited visibility into **true profit drivers**
- Over-dependence on specific customers or channels
- Poor understanding of seasonal demand patterns
- Difficulty tracking **budget vs actual performance**

This project addresses these challenges by transforming raw sales data into **actionable, decision-ready insights**.

---

## 🎯 Project Objectives
- Perform structured **Exploratory Data Analysis (EDA)**
- Identify **growth opportunities and risk areas**
- Measure **profitability and efficiency**
- Support **data-driven strategic decisions**
- Demonstrate strong proficiency in **Python, SQL, and BI tools**
- Present insights in a **clear, business-focused manner**

---

## 🛠️ Tech Stack (ATS-Optimized)

### 🔹 Programming & Analysis
- **Python** (Pandas, NumPy, Matplotlib, Seaborn)

### 🔹 Databases & Querying
- **PostgreSQL**
- **pgAdmin**
- Advanced SQL (CTEs, Window Functions, Aggregations)

### 🔹 Visualization & Reporting
- **Power BI**

### 🔹 Version Control
- **Git**
- **GitHub**

---

## 🔄 Project Workflow

### 1️⃣ Data Preparation (Python)
- Merged multiple datasets (sales, customers, products, regions, budgets)
- Cleaned and standardized data
- Engineered key metrics:
  - **Revenue**
  - **Profit**
  - **Profit Margin (%)**
  - Time-based features (month, year)
- Validated data integrity (no missing or duplicate records)

### 2️⃣ Exploratory Data Analysis (EDA)
- Identified trends, distributions, and outliers
- Analyzed:
  - Seasonality
  - Product concentration
  - Channel contribution
  - Regional performance
  - Customer segmentation

### 3️⃣ Advanced SQL Business Analysis
- Imported cleaned dataset into PostgreSQL
- Solved **15 real-world business problems using SQL**
- Applied:
  - CTEs
  - Window functions
  - Ranking & percentiles
  - Statistical functions

### 4️⃣ Power BI Dashboard
- Built interactive dashboards for stakeholder self-service
- Enabled slicing by:
  - Time
  - Product
  - Region
  - Channel
- Highlighted KPIs, trends, and insights visually

---

## 🗄️ SQL-Based Business Problems Solved

The SQL component focuses on **decision-oriented analytics**, not basic querying.

### 🔍 Key Business Questions Addressed:
- Regional **profit efficiency** analysis
- **Margin leakage** detection across channels
- **Pareto (80/20) analysis** for product optimization
- Identification of **high-revenue, low-margin SKUs**
- **Customer concentration risk** analysis
- Seasonal **revenue volatility** measurement
- **Budget vs actual** performance comparison
- Detection of **channel dependency risks**
- Order value **segmentation analysis**
- Pricing vs volume **revenue driver analysis**
- Creation of **low-margin alert logic**
- Geographic **profit hotspot identification**

📌 These analyses help businesses:
- Improve pricing strategies
- Optimize product portfolios
- Reduce dependency risk
- Increase overall profitability

---

## 📊 Power BI Dashboard Highlights
- Revenue & profit trend analysis
- Top-performing products and customers
- Channel-wise contribution
- Regional performance maps
- Scenario-based revenue views

Designed for **non-technical stakeholders** to explore insights independently.

---

## 📈 Key Findings
- Revenue shows strong **seasonal patterns**
- A small group of products contributes a large share of revenue
- Wholesale dominates volume, while Export leads in margins
- Certain customers generate high revenue but lower margins
- Profitability is more influenced by **pricing than quantity**

---

## 📌 Business Recommendations
- Launch targeted promotions during low-demand periods
- Focus investment on high-impact SKUs
- Re-evaluate pricing for low-margin products
- Diversify customer and channel dependencies
- Strengthen regional strategies based on top-performing states

---

## ✅ Project Impact
- Demonstrates **real-world analytics problem-solving**
- Combines **technical depth with business reasoning**
- Suitable for roles such as:
  - Data Analyst
  - Business Analyst
  - Analytics Engineer
  - Junior Data Scientist

---

## ▶️ How to Run This Project

This section explains how to reproduce the complete end-to-end analytics workflow, from data preparation to SQL analysis and dashboard visualization.

---

### 🔹 Step 1: Clone the Repository
Clone the GitHub repository to your local system:

```bash
git clone https://github.com/your-username/sales-analytics-project.git
cd sales-analytics-project
```

---

### 🔹 Step 2: Python – Data Cleaning & Exploratory Data Analysis (EDA)

1. Open **Jupyter Notebook** or **VS Code**
2. Navigate to the `notebooks/` folder
3. Open and run the `.ipynb` file to perform:
   - Data cleaning
   - Feature engineering
   - Exploratory Data Analysis (EDA)
4. This step generates the **final cleaned dataset** used for SQL and Power BI analysis

**Output produced:**
- Cleaned sales dataset exported to the `data/` folder (Excel/CSV)

---

### 🔹 Step 3: Load Data into PostgreSQL (SQL Analysis)

1. Open **pgAdmin**
2. Create a PostgreSQL database named:

```text
sales_analytics_db
```

3. Create the required table schema in PostgreSQL
4. Import the cleaned dataset from the `data/` folder into the database
5. Validate that the data is loaded correctly:

```sql
SELECT COUNT(*) FROM sales_data;
```

---

### 🔹 Step 4: Execute SQL Business Queries

1. Navigate to the `sql/` folder
2. Open the SQL files using **pgAdmin**
3. Run the queries sequentially

Each SQL file contains:
- Clearly defined **business questions**
- Well-documented **SQL solutions**
- Use of **CTEs, window functions, ranking, and aggregations**
- Comments explaining **why the query is used and how it helps the business**

This step uncovers insights related to:
- Profitability drivers
- Margin leakage
- Customer concentration risk
- Channel dependency
- Seasonal trends
- Budget vs actual performance

---

### 🔹 Step 5: Power BI Dashboard

1. Open **Power BI Desktop**
2. Navigate to the `powerbi/` folder
3. Open the `.pbix` file
4. Refresh the data connection if required
5. Use slicers and filters to explore insights by:
   - Region
   - Product
   - Channel
   - Time period

The dashboard enables **self-service analytics** for business stakeholders.

---

## 🏁 Conclusion

This project demonstrates a **real-world, end-to-end data analytics workflow** by integrating:

- **Python** for data cleaning, feature engineering, and EDA  
- **PostgreSQL (SQL)** for advanced, business-driven analysis  
- **Power BI** for interactive visualization and reporting  

The insights derived from this project help organizations improve pricing strategies, optimize product portfolios, reduce dependency risks, and make informed strategic decisions.

---

## 👤 Author

**Mohamed Sahad M**  
Master’s in Statistics  
Data Analytics | SQL | Power BI | Python  
📍 India

---



