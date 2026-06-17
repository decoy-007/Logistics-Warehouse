--======================================================
--Rank products by demand within category 
--======================================================

--products by demand within category 
select
	item_id,
	category,
	daily_demand,
	ROW_NUMBER() OVER (PARTITION BY category Order By daily_demand desc) Demand_rank
from Warehouse;

--Top 5 products per category
with product_demand as(
	select
	item_id,
	category,
	daily_demand,
	ROW_NUMBER() OVER (PARTITION BY category Order By daily_demand desc) Demand_rank
from Warehouse
)
select*
from product_demand
where Demand_rank <= 5