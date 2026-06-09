--查看資料表
--select * from test_db."public"."f_lvr_land_a" limit 10;

--新增坪數欄位
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "土地移轉總總坪數" numeric;
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "建物移轉總坪數" numeric;
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "車位移轉總坪數" numeric;

--計算坪數並更新欄位值
update test_db."public"."f_lvr_land_a" set "土地移轉總總坪數"="土地移轉總面積平方公尺"*0.3025;
update test_db."public"."f_lvr_land_a" set "建物移轉總坪數"="建物移轉總面積平方公尺"*0.3025;
update test_db."public"."f_lvr_land_a" set "車位移轉總坪數"="車位移轉總面積平方公尺"*0.3025;

--新增總價元-車位總價元除以房地(土地+建物)-車位平方公尺欄位
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "不含車位每坪單價" numeric;

--計算不含車位每坪單價並更新欄位值
update test_db."public"."f_lvr_land_a" set "不含車位每坪單價"=round(("總價元"-"車位總價元")/nullif(("建物移轉總坪數"-"車位移轉總坪數"), 0), 0); 

--新增屋齡欄位
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "屋齡_年" numeric;
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "屋齡_月" numeric;

--計算屋齡並更新欄位值
update test_db."public"."f_lvr_land_a" set "屋齡_年"=extract(year from age(to_date("交易西元年月日", 'YYYYMMDD'),to_date("建築完成西元年月日", 'YYYYMMDD')));
update test_db."public"."f_lvr_land_a" set "屋齡_月"=extract(month from age(to_date("交易西元年月日", 'YYYYMMDD'),to_date("建築完成西元年月日", 'YYYYMMDD')));


