--================================
-- REVENUE ANALYSIS
--================================
-- total order for each category last month

select
	category,
	SUM(total_orders_last_month) total_orders
from Warehouse
group by category
order by total_orders desc

-- total current Inventory value by category

select
category,
	SUM(stock_level * unit_price) Inventory_value
	from Warehouse
group by category
order by Inventory_value desc

--most valuable products in inventory
select top 20
	item_id,
	category,
	stock_level * unit_price  Inventory_value
from Warehouse
order by Inventory_value desc