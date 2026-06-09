with source as (
        select * from {{ source('taiwan_realestate_raw', 'a_lvr_land_a') }}
  ),
  renamed as (
      select
          {{ adapter.quote("鄉鎮市區") }},
        {{ adapter.quote("交易標的") }},
        {{ adapter.quote("土地位置建物門牌") }},
        {{ adapter.quote("土地移轉總面積平方公尺") }},
        {{ adapter.quote("都市土地使用分區") }},
        {{ adapter.quote("非都市土地使用分區") }},
        {{ adapter.quote("非都市土地使用編定") }},
        {{ adapter.quote("交易年月日") }},
        {{ adapter.quote("交易筆棟數") }},
        {{ adapter.quote("移轉層次") }},
        {{ adapter.quote("總樓層數") }},
        {{ adapter.quote("建物型態") }},
        {{ adapter.quote("主要用途") }},
        {{ adapter.quote("主要建材") }},
        {{ adapter.quote("建築完成年月") }},
        {{ adapter.quote("建物移轉總面積平方公尺") }},
        {{ adapter.quote("建物現況格局-房") }},
        {{ adapter.quote("建物現況格局-廳") }},
        {{ adapter.quote("建物現況格局-衛") }},
        {{ adapter.quote("建物現況格局-隔間") }},
        {{ adapter.quote("有無管理組織") }},
        {{ adapter.quote("總價元") }},
        {{ adapter.quote("單價元平方公尺") }},
        {{ adapter.quote("車位類別") }},
        {{ adapter.quote("車位移轉總面積平方公尺") }},
        {{ adapter.quote("車位總價元") }},
        {{ adapter.quote("備註") }},
        {{ adapter.quote("編號") }},
        {{ adapter.quote("主建物面積") }},
        {{ adapter.quote("附屬建物面積") }},
        {{ adapter.quote("陽台面積") }},
        {{ adapter.quote("電梯") }},
        {{ adapter.quote("移轉編號") }}

      from source
  )
  select * from renamed
    