--========================================
-- TURNOVER ANALYSIS
--========================================

--Top-performing products by turnover
select top 20
	item_id,
	turnover_ratio
from Warehouse
order by turnover_ratio desc

--product categories that move inventory fastest
select
category,
AVG(turnover_ratio) Avg_turnover
from Warehouse
group by category
order by Avg_turnover desc

