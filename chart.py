import pandas as pd
import streamlit as st
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv
load_dotenv()  # 從 .env 檔案載入環境變數
db_user = os.getenv("DB_USER")
db_password = os.getenv("DB_PASSWORD")
db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")
db_name = os.getenv("DB_NAME")
db_url = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
engine = create_engine(db_url)
schema_name = os.getenv("DB_SCHEMA")
table_name = "dim_a_lvr_land_a" 
query = f"SELECT * FROM {schema_name}.{table_name};"

def format_chinese_unit(num):
    if num >= 1_000_000:
        return f"{num / 1_000_000:.1f}百萬"
    elif num >= 10_000:
        return f"{num / 10_000:.1f}萬"
    else:
        return f"{int(num):,}元"
    
# 讀取資料並自動轉換為 DataFrame
df_result = pd.read_sql(query, con=engine)
chart1=df_result[df_result['備註'].isnull()].groupby(df_result['交易西元年月日'].str[:6]).agg(
不含車位平均每坪單價=('不含車位每坪單價', 'mean'),
交易件數=('編號', 'count')
).reset_index()
chart1['不含車位平均每坪單價(萬)']=chart1['不含車位平均每坪單價']/10_000

st.title("數據分析儀表板")
st.write("以下為台北市近八個月的交易數據(不含特殊備註)：")
col1, col2 = st.columns(2)
with col1:
    st.subheader("各月平均每坪單價")
    sorted_df = chart1.sort_values(by="交易西元年月日", ascending=False)
    st.line_chart(sorted_df, x='交易西元年月日', y='不含車位平均每坪單價(萬)',height=300)

with col2:
    st.subheader("各月交易件數")
    st.bar_chart(chart1.sort_values(by=['交易西元年月日','交易件數'], ascending=False), x='交易西元年月日', y='交易件數',height=300,use_container_width=True)

st.dataframe(chart1.sort_values(by=['交易西元年月日','不含車位平均每坪單價'], ascending=False).reset_index(drop=True))