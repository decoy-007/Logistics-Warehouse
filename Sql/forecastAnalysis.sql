--====================================
-- FORECAST ANALYSIS
--====================================

--Identify products likely to run out soon
with forecast as(
select
item_id,
category,
forecasted_demand_next_7d,
stock_level - forecasted_demand_next_7d expected_balance
from Warehouse

)
select*,
CASE 
	WHEN expected_balance < forecasted_demand_next_7d THEN 'Restock now'
	WHEN expected_balance = forecasted_demand_next_7d THEN 'Low stock'
	ELSE 'Safe'
END forecast_indicator
from forecast;

