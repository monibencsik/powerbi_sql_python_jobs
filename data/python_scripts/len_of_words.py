import pandas as pd

df=pd.read_csv("/Users/mbencsik/Documents/sql/job_postings/job_postings.csv")

max_title = df["title"].str.len().max()
max_desc = df["description"].str.len().max()
max_job_url = df["job_posting_url"].str.len().max()
max_appl_url = df["application_url"].str.len().max()
max_skills_desc = df["skills_desc"].str.len().max()
max_domain = df["posting_domain"].str.len().max()

print(f"Max characters in title:{max_title}")
print(f"Max characters in description:{max_desc}")
print(f"Max characters in job posting url:{max_job_url}")
print(f"Max characters in application url:{max_appl_url}")
print(f"Max characters in skills description:{max_skills_desc}")
print(f"Max characters in posting domain:{max_domain}")


#df.to_csv('job_postings_pipe.csv', sep='|', index=False)