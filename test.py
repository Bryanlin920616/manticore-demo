import pandas as pd

# 讀取 CSV 檔案
df = pd.read_csv('cn_wenyan.csv')

# 取前五筆資料
df_head = df.head()

# 將前五筆資料存成新的 CSV 檔案
df_head.to_csv('cn_wenyan_head.csv', index=False)

print("前五筆資料已存成 cn_wenyan_head.csv")