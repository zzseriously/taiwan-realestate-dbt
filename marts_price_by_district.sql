/*
select * from test_db."public"."f_lvr_land_a";
select distinct "交易標的" from test_db."public"."f_lvr_land_a";
select distinct "備註" from test_db."public"."f_lvr_land_a";
*/

select left("交易西元年月日", 6) as "交易年月", "鄉鎮市區", round(avg("不含車位每坪單價"), 0) as "平均不含車位每坪單價"
from test_db."public"."f_lvr_land_a"
where "交易標的" in ('建物','房地(土地+建物)','房地(土地+建物)+車位')
and "備註" is null
group by "鄉鎮市區",left("交易西元年月日", 6)
order by "交易年月" desc, "平均不含車位每坪單價" desc;

select left("交易西元年月日", 6) as "交易年月","不含車位每坪單價","建物移轉總坪數","車位移轉總坪數",concat("屋齡_年", '年', "屋齡_月", '個月') as "屋齡"
,*
from test_db."public"."f_lvr_land_a"
where "交易標的" in ('建物','房地(土地+建物)','房地(土地+建物)+車位')
and "備註" is null
and "鄉鎮市區"='三重區'
and "不含車位每坪單價"<=550000;