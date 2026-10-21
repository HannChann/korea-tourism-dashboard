CREATE DATABASE korea_tourism;
SELECT count(*) FROM korea_tourism.arrivals;
SELECT * FROM korea_tourism.arrivals LIMIT 10;

-- Q1/Q4: Top Source markets by total arrivals 
SELECT 
country,
SUM(arrivals) AS total_arrivals 
FROM korea_tourism.arrivals
GROUP BY country
ORDER BY total_arrivals DESC
LIMIT 10;

-- Grand total arrivals across all 55 countries 
SELECT 
SUM(arrivals) AS grand_total
FROM korea_tourism.arrivals;

-- each countries share of total arrivals (top 10 by volume)
SELECT 
country,
SUM(arrivals) AS total_arrivals, 
ROUND (100.0 * SUM(arrivals)/ (SELECT SUM(arrivals) FROM korea_tourism.arrivals), 1) AS pct_of_total
FROM korea_tourism.arrivals
GROUP BY country
ORDER BY total_arrivals DESC
LIMIT 10;

-- New query: connection test, confirm data is still here
SELECT COUNT(*) FROM korea_tourism.arrivals;

-- New query: total arrivals by month (seasonality patterns across the year)
SELECT
   month,
   SUM(arrivals) AS total_arrivals
FROM korea_tourism.arrivals 
GROUP BY month
ORDER BY month;

-- New query: AVG arrivals per month (fair seasonality, cancels uneven days & year counts)
SELECT 
   month,
   ROUND(AVG(arrivals)) AS avg_arrivals
FROM korea_tourism.arrivals
GROUP BY month 
ORDER BY avg_arrivals DESC;

-- New query: (Q2 rescoped): fastest-growing markets by YoY %, with volume for context 
SELECT
   country,
   SUM(arrivals) AS total_arrivals, 
   ROUND (AVG(yoy_growth_pct), 1) AS avg_yoy_growth
FROM korea_tourism.arrivals 
GROUP BY country
ORDER BY avg_yoy_growth DESC
LIMIT 15;
