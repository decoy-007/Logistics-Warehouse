
--==========================================
-- DEMAND ANALYSIS
--==========================================

-- Top 10 highest demand products
select TOP 10
item_id,
category,
daily_demand
from Warehouse
order by daily_demand desc

--Average daily demand of each category


select
category,
ROUND(AVG(daily_demand),1) AS avgDailyDemand
from Warehouse
Group by category
order by avgDailyDemand desc

--Products with unpredictable demand

select top 20
item_id,
category,
demand_std_dev
from Warehouse
order by demand_std_dev desc
