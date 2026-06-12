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
query = f"SELECT 鄉鎮市區,avg(不含車位每坪單價) FROM {schema_name}.{table_name} where 備註 is null group by 鄉鎮市區 order by avg(不含車位每坪單價) desc;"

# 讀取資料並自動轉換為 DataFrame
df_result = pd.read_sql(query, con=engine)
st.dataframe(df_result)  