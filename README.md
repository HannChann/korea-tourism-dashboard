# Korea Tourism Intelligence Dashboard

An end-to-end data analytics project analysing foreign visitor arrivals to South Korea, built to answer real business questions a tourism board would ask when deciding where to focus marketing and investment.

**Tools:** MySQL · Power BI · Excel · SQL · Git/GitHub  
---

## The scenario

I took the role of a junior analyst at the Korea Tourism Organization, asked to advise on where to concentrate tourism marketing and investment. The project runs the full analytics workflow: defining the questions, sourcing and cleaning the data, building a database, querying it with SQL, and presenting the findings in an interactive dashboard.

## Business questions

1. Which source markets send the most foreign arrivals?  
2. Which of our major markets are growing fastest? *(originally "which segment generates the greatest economic value" — rescoped, see Limitations)*  
3. How does tourism demand change through the year (seasonality)?  
4. Which international markets offer the greatest growth potential?

## The data

- **Source:** Korea Tourism Organization arrivals by nationality, plus KOSIS arrivals by port of entry.  
- **Scope:** 55 countries, monthly, January 2024 – January 2026 (1,500 rows).  
- **Fields:** date, year, month, region, country, arrivals, arrivals\_prev\_year, yoy\_growth\_pct.

## Key findings

**1\. Tourism is heavily concentrated in three markets.** China (28.7%), Japan (19.4%) and Taiwan (9.7%) together account for roughly **58% of all arrivals**. This concentration is a strategic risk: a downturn in any one of these markets — especially China — would move the national total significantly.

**2\. Demand is mildly seasonal, peaking in late summer.** On a fair per-month average basis, arrivals peak in **August**, with a secondary autumn lift (October), and bottom out in **January–February**. The swing from winter low to summer peak is around 35%. *(Using the average rather than the raw monthly total matters here: the data window covers an uneven number of each month, so totals mislead and averages reveal the true pattern.)*

**3\. China leads on growth as well as volume.** Among markets large enough to matter, **China is both the biggest and the fastest-growing** (+134% year-over-year on a base of 10.5M), with **Taiwan** also showing strong growth at scale (+43% on 3.5M). Several small markets posted higher growth percentages, but on bases too small to be strategically meaningful — filtered out to avoid a misleading conclusion.

**Headline:** Korea's inbound tourism depends heavily on a few East Asian markets, led by China, which dominates on volume, share, and growth. That concentration is both the biggest opportunity and the biggest risk.

## How it was built

1. **Business understanding** — defined the questions and success criteria.  
2. **Data sourcing & cleaning** — collected KTO/KOSIS data, built country→region and calendar lookups, produced a clean 1,500-row dataset.  
3. **Database** — loaded the data into a MySQL database (korea\_tourism) and verified the load.  
4. **Analysis (SQL)** — answered each question with GROUP BY aggregations, a share-of-total subquery, year-over-year growth, and seasonality queries.  
5. **Visualisation (Power BI)** — built an interactive dashboard with a DAX measure for market concentration.

## Repository contents

| File | What it is |
| :---- | :---- |
| README.md | This overview |
| dashboard.pdf / dashboard.png | The final Power BI dashboard |
| Korea\_Tourism\_Dashboard.pbix | The editable Power BI file |
| KOREA\_TOURISM\_project.sql | All SQL analysis queries |
| korea\_arrivals\_clean.csv | The cleaned dataset |

## Limitations & next steps

- **Economic value not yet measured.** Question 2 originally asked which visitor segment generates the most *spending*. The current dataset contains arrival counts only, not expenditure, so the question was rescoped to growth momentum. A clear next step is to source KTO/KOSIS tourism expenditure-by-nationality data and join it in, which would allow a genuine value analysis.  
- **Port-of-entry data** could be added to answer the "which airports" question and link arrivals to regions more directly.

## Author

**Chan** — transitioning into data analytics, with a background in tourism and development policy. 