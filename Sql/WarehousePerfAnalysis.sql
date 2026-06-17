--===========================================
-- WAREHOUSE PERF ANALYSIS
--===========================================

-- Analysing pick up efficieny by zone 
select
	zone,
	avg(picking_time_seconds) [avgPickUpTime(sec)]
	from Warehouse
	group by zone
order by [avgPickUpTime(sec)] desc

--Best and worst warehouse zones
SELECT
	zone,
	AVG(layout_efficiency_score) AS AvgEfficiency
	FROM Warehouse
	GROUP BY zone
ORDER BY AvgEfficiency DESC;