import pandas as pd
import csv

df = pd.read_csv("/Users/mbencsik/Documents/sql/job_postings/job_postings.csv")

quote_columns = [
    "description",
    "title",
    "location",
    "job_posting_url",
    "application_url",
    "skills_desc"
]

with open("job_postings_quoted.csv", "w", newline='', encoding="utf-8") as f:
    writer = csv.writer(f, quoting=csv.QUOTE_MINIMAL)
    writer.writerow(df.columns)

    for _, row in df.iterrows():
        new_row = []
        for col in df.columns:
            val = row[col]
            if col in quote_columns:
                
                str_val = str(val).replace('"', '""')
                new_row.append(f'"{str_val}"')
            else:
                new_row.append(val)
        writer.writerow(new_row)