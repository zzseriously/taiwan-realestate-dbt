
select
編號
,交易屋齡_年
from {{ref('dim_a_lvr_land_a')}}
where 交易屋齡_年<0