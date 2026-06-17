--===========================
--	INVENTORY ANALYSIS
--===================================
-- items that are at or below reorder point
select
  item_id,
  category,
  stock_level,
  reorder_point
from Warehouse
where stock_level <= reorder_point


    --inventory risk level
CREATE View V_Warehouse_InventoryRisk AS
select
  item_id,
  category,
  stock_level,
  reorder_point,
CASE 
	WHEN stock_level < reorder_point THEN 'Critical'
	WHEN stock_level < reorder_point *1.2 THEN 'Warning'
	ELSE 'Safe'
END InventoryStatus
from Warehouse;

select*
from V_Warehouse_InventoryRisk
where InventoryStatus = 'warning'


--Stock levels of each category
Select
	category,
	sum(stock_level) As totalLevel
from Warehouse
group by category
order by category desc