-- Q1: Which US region has the highest profit per order, and how does it compare to revenue share?

-- Why this matters:
-- Identifies regions that are efficient (high profit per order) vs volume-driven regions.

SELECT
    us_region,
    SUM(profit) / COUNT(order_number) AS profit_per_order,
    SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER () AS revenue_share_pct
FROM sales_data
GROUP BY us_region
ORDER BY profit_per_order DESC;


-- Explanation:
-- Window function OVER() is used to compute total revenue across all regions
-- without collapsing the group-level aggregation.
--------------------------------------------------------------------

-- Q2: Identify channels with high revenue but low profit margins
-- Business Use:
-- Detects margin leakage in dominant sales channels.
SELECT
    channel,
    SUM(revenue) AS total_revenue,
    AVG(profit_margin_pct) AS avg_margin
FROM sales_data
GROUP BY channel
ORDER BY total_revenue DESC;



--------------------------------------------------------------------

-- Q3: Identify minimum set of products contributing to 80% of total revenue
-- Business Use:
-- Helps focus inventory, pricing, and promotions on high-impact SKUs.
WITH product_revenue AS (
    SELECT
        product_name,
        SUM(revenue) AS total_revenue
    FROM sales_data
    GROUP BY product_name
),
ranked_products AS (
    SELECT
        product_name,
        total_revenue,
        SUM(total_revenue) OVER (ORDER BY total_revenue DESC)
            / SUM(total_revenue) OVER () AS cumulative_pct
    FROM product_revenue
)
SELECT *
FROM ranked_products
WHERE cumulative_pct <= 0.80;
-- Explanation:
-- CTEs + cumulative SUM() implement Pareto (80/20) analysis.


--------------------------------------------------------------------
-- Q4: High revenue but low margin products
-- Business Use:
-- Finds products silently hurting profitability.
WITH stats AS (
    SELECT
        product_name,
        SUM(revenue) AS revenue,
        AVG(profit_margin_pct) AS margin
    FROM sales_data
    GROUP BY product_name
),
thresholds AS (
    SELECT
        PERCENTILE_CONT(0.7) WITHIN GROUP (ORDER BY revenue) AS rev_70,
        PERCENTILE_CONT(0.3) WITHIN GROUP (ORDER BY margin) AS mar_30
    FROM stats
)
SELECT s.*
FROM stats s, thresholds t
WHERE s.revenue >= t.rev_70
  AND s.margin <= t.mar_30;



--------------------------------------------------------------------

-- Q5: Customers with high revenue but below-average margins
-- Business Use:
-- Identifies discount abuse and renegotiation candidates.
SELECT
    customer_name,
    SUM(revenue) AS total_revenue,
    AVG(profit_margin_pct) AS avg_margin
FROM sales_data
GROUP BY customer_name
HAVING SUM(revenue) > 10000000
   AND AVG(profit_margin_pct) <
       (SELECT AVG(profit_margin_pct) FROM sales_data);


--------------------------------------------------------------------
-- Q6: Region with highest seasonal revenue volatility
-- Business Use:
-- Reveals unstable regions needing demand smoothing.
SELECT
    us_region,
    STDDEV(revenue) AS revenue_volatility
FROM sales_data
GROUP BY us_region
ORDER BY revenue_volatility DESC;




--------------------------------------------------------------------

-- Q7: Budget vs Actual (2017)
-- Business Use:
-- Evaluates planning accuracy and execution.
SELECT
    us_region,
    SUM(revenue) AS actual_revenue,
    SUM(budget) AS budgeted_revenue,
    SUM(revenue) * 100.0 / SUM(budget) AS budget_utilization_pct
FROM sales_data
WHERE EXTRACT(YEAR FROM order_date) = 2017
GROUP BY us_region
ORDER BY budget_utilization_pct DESC;



--------------------------------------------------------------------

-- Q8: Revenue concentration risk (Top customers)
-- Business Use:
-- Measures dependency on few customers.
WITH ranked_customers AS (
    SELECT
        customer_name,
        SUM(revenue) AS revenue,
        RANK() OVER (ORDER BY SUM(revenue) DESC) AS rnk
    FROM sales_data
    GROUP BY customer_name
)
SELECT
    SUM(revenue) * 100.0 /
    (SELECT SUM(revenue) FROM sales_data) AS top_10_pct
FROM ranked_customers
WHERE rnk <= 10;



--------------------------------------------------------------------
-- Q9: Low revenue but high margin states
-- Business Use:
-- Identifies niche high-quality markets.
SELECT
    state_name,
    SUM(revenue) AS revenue,
    AVG(profit_margin_pct) AS margin
FROM sales_data
GROUP BY state_name
HAVING SUM(revenue) <
       (SELECT AVG(revenue) FROM sales_data)
   AND AVG(profit_margin_pct) >
       (SELECT AVG(profit_margin_pct) FROM sales_data);



--------------------------------------------------------------------
-- Q10: Order value segmentation
-- Business Use:
-- Understands margin behavior by order size.
SELECT
    CASE
        WHEN revenue < PERCENTILE_CONT(0.33)
             WITHIN GROUP (ORDER BY revenue) THEN 'Low'
        WHEN revenue < PERCENTILE_CONT(0.66)
             WITHIN GROUP (ORDER BY revenue) THEN 'Medium'
        ELSE 'High'
    END AS order_segment,
    AVG(profit_margin_pct) AS avg_margin
FROM sales_data
GROUP BY order_segment;


--------------------------------------------------------------------
-- Q11: Price vs Quantity revenue driver
-- Business Use:
-- Helps decide premium vs volume strategy.
SELECT
    product_name,
    CORR(unit_price, revenue) AS price_corr,
    CORR(quantity, revenue) AS quantity_corr
FROM sales_data
GROUP BY product_name;

--------------------------------------------------------------------

-- Q12: Regions over-dependent on a single channel
-- Business Use:
-- Identifies channel risk.
WITH channel_share AS (
    SELECT
        us_region,
        channel,
        SUM(revenue) * 100.0 /
        SUM(SUM(revenue)) OVER (PARTITION BY us_region) AS channel_pct
    FROM sales_data
    GROUP BY us_region, channel
)
SELECT *
FROM channel_share
WHERE channel_pct > 70;


--------------------------------------------------------------------
-- Q13: Month-over-month growth consistency
-- Business Use:
-- Identifies reliable growth products.
SELECT
    product_name,
    order_month,
    revenue - LAG(revenue)
        OVER (PARTITION BY product_name ORDER BY order_month) AS mom_growth
FROM (
    SELECT
        product_name,
        order_month,
        SUM(revenue) AS revenue
    FROM sales_data
    GROUP BY product_name, order_month
) t;



--------------------------------------------------------------------

-- Q14: Low margin alert system
-- Business Use:
-- Flags margin erosion at order level.
SELECT *
FROM sales_data
WHERE profit_margin_pct <
      0.8 * (SELECT AVG(profit_margin_pct) FROM sales_data);


--------------------------------------------------------------------

-- Q15: Geographic profit hotspots
-- Business Use:
-- Helps regional sales & logistics planning.
SELECT
    us_region,
    state_name,
    AVG(profit) AS avg_profit
FROM sales_data
GROUP BY us_region, state_name
ORDER BY avg_profit DESC;


--------------------------------------------------------------------

