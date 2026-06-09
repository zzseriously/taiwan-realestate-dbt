

select 
*
,cast((建築完成年月+'19110000') as varchar) as 建築完成西元年月日
,cast((交易年月日+'19110000') as varchar) as 交易西元年月日
,round(土地移轉總面積平方公尺::integer*0.3025,2) as 土地移轉總總坪數
,round(建物移轉總面積平方公尺::integer*0.3025,2) as 建物移轉總坪數
,round(車位移轉總面積平方公尺::integer*0.3025,2) as 車位移轉總坪數
from {{ref('a_lvr_land_b')}}
