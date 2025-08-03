import pandas as pd


df = pd.read_csv("/Users/mbencsik/Documents/sql/job_postings/job_postings_quoted.csv")

df['title'] = df['title'].astype(str).str.replace(',', ' ', regex=False)
df['description'] = df['description'].astype(str).str.replace(',', ' ', regex=False)


df['original_listed_time'] = pd.to_datetime(df['original_listed_time'] / 1000, unit='s')
df['expiry'] = pd.to_datetime(df['expiry'] / 1000, unit='s')
df['closed_time'] = pd.to_datetime(df['closed_time'] / 1000, unit='s')
df['listed_time'] = pd.to_datetime(df['listed_time'] / 1000, unit='s')
df['scraped'] = pd.to_datetime(df['scraped'], unit='s')

df.to_csv('job_postings_propertime.csv', index=False)