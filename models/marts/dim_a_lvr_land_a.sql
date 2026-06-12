
select 
*
,round((總價元-車位總價元)/nullif((建物移轉總坪數-車位移轉總坪數)::numeric, 0), 0) as 不含車位每坪單價
,case 
when extract(year from age(to_date(交易西元年月日, 'YYYYMMDD'),to_date(建築完成西元年月日, 'YYYYMMDD')))<0 then 0 
else extract(year from age(to_date(交易西元年月日, 'YYYYMMDD'),to_date(建築完成西元年月日, 'YYYYMMDD'))) 
end as 交易屋齡_年
,case 
when extract(month from age(to_date(交易西元年月日, 'YYYYMMDD'),to_date(建築完成西元年月日, 'YYYYMMDD')))<0 then 0
end as 交易屋齡_月
from {{ref('stg_a_lvr_land_a')}}