--查看資料表
--select * from test_db."public"."f_lvr_land_a" limit 10;

--將數字欄位轉換成適當的數據類型
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "土地移轉總面積平方公尺" TYPE numeric USING ("土地移轉總面積平方公尺"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "建物移轉總面積平方公尺" TYPE numeric USING ("建物移轉總面積平方公尺"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "建物現況格局-房" TYPE integer USING ("建物現況格局-房"::integer);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "建物現況格局-廳" TYPE integer USING ("建物現況格局-廳"::integer);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "建物現況格局-衛" TYPE integer USING ("建物現況格局-衛"::integer);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "總價元" TYPE numeric USING ("總價元"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "單價元平方公尺" TYPE numeric USING ("單價元平方公尺"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "車位移轉總面積平方公尺" TYPE numeric USING ("車位移轉總面積平方公尺"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "車位總價元" TYPE numeric USING ("車位總價元"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "主建物面積" TYPE numeric USING ("主建物面積"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "附屬建物面積" TYPE numeric USING ("附屬建物面積"::numeric);
ALTER TABLE test_db."public"."f_lvr_land_a" ALTER COLUMN "陽台面積" TYPE numeric USING ("陽台面積"::numeric);

--新增建築完成西元年月、交易西元年月日兩個欄位
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "建築完成西元年月日" varchar;
ALTER TABLE test_db."public"."f_lvr_land_a" ADD COLUMN "交易西元年月日" varchar;

--將建築完成年月、交易年月日轉換成西元格式存入新欄位
update test_db."public"."f_lvr_land_a" set "建築完成西元年月日"=("建築完成年月"::int+19110000)::varchar;
update test_db."public"."f_lvr_land_a" set "交易西元年月日"=("交易年月日"::int+19110000)::varchar;

