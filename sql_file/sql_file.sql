create database crop_production;

show databases;

use crop_production;

select *from Crop_Production;
select * from climate_agriculture;

#1. Display total production for each state. Sort in descending order.

 select distinct state, sum(production) from Crop_Production 
 group by state
 order by sum(production) desc;
 
 #2. Find average annual rainfall.
 
 select avg(annual_rainfall) from climate_agriculture;
 
 #3. Display crops with production greater than 50,000.
 
 select distinct crop, production from Crop_Production where production > 50000;
 
 #4. Show total production and average rainfall for each crop. 
 
 select Crop_Production.crop,sum(Crop_Production.production),avg(climate_agriculture.annual_rainfall) as avg_rainfall
 from Crop_Production 
 inner join climate_agriculture
 on crop_production.record_id=climate_agriculture.record_id
 group by Crop_Production.crop;

# 5. Display states where total production is greater than 200000. 

 select state, sum(production) from Crop_Production
 group by state
 having sum(production)>200000;
 
 #6. Find crops whose average production is higher than overall average production.
 
 select crop , avg(production) from Crop_Production
 group by crop 
 order by avg(production) desc
 limit 1;
 
 # 7  Display state-wise total production and average fertilizer usage.
 
 select Crop_Production.state,sum(Crop_Production.production),avg(climate_agriculture.fertilizer) 
 from Crop_Production 
 inner join climate_agriculture
 on crop_production.record_id=climate_agriculture.record_id
 group by Crop_Production.state;
 
 # 8  Find the state with the highest total production.
 
 select state , sum(production) from Crop_Production
 group by state 
 order by sum(production) desc
 limit 1;
 
 # 9  Find crops grown where rainfall is above overall average rainfall.
 select Crop_Production.crop,avg(climate_agriculture.annual_rainfall) 
 from Crop_Production 
 inner join climate_agriculture
 on crop_production.record_id=climate_agriculture.record_id
 group by Crop_Production.crop;
 
 # 10 . Find states where the total production is greater than 200000 and the average annual rainfall is greater than 800 mm. Display state, total production, and average rainfall. Sort by total production in descending order.  

 select Crop_Production.state,avg(climate_agriculture.annual_rainfall),sum(Crop_Production.production)
 from Crop_Production 
 inner join climate_agriculture
 on crop_production.record_id=climate_agriculture.record_id
 group by Crop_Production.state
 having sum(Crop_Production.production)>200000 and avg(climate_agriculture.annual_rainfall)>800
 ;
 