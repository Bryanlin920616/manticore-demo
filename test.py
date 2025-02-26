import pandas as pd

# 讀取 CSV 檔案
df = pd.read_csv('cn_wenyan.csv')

print(df.head())
print(df.columns)