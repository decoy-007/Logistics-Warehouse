--======================================
-- STOCK OUT ANALYSIS
--======================================

--Total of stock outs for each category last month
select
	category,
	sum(stockout_count_last_month) AS Total_stock_outs
from Warehouse
group by category
order by Total_stock_outs desc;


--Stockouts vs Fulfillment Rate
select
	item_id,
	category,
	stockout_count_last_month,
	order_fulfillment_rate
from Warehouse
order by stockout_count_last_month desc;

