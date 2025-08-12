# Jobs dataset analysis and visualisation
Analysis and visualisation of a jobs dataset from 2023

## Aim
To learn and showcase data visualisation with PowerBI and Tableau

## Data
The dataset was downloaded from [here](https://huggingface.co/datasets/xanderios/linkedin-job-postings). Originally it is a 130+MB file, which in the end was reduced to a 10+kb csv file to be imported into PowerBI.
There are 33+K rows and 23 features in this dataset, which was scraped between Aug-Dec 2023, mainly focusing in US jobs listed on LinkedIn. It is incomplete, there are NA values in most of the columns. It consists of a combination of numerical and categorical values, strings, integer and datetime datatypes.

## Analysis
The SQL table were created in MySQL Workbench, but the dataset did not import correctly the first time python pandas was used to explore and clean it. 
The following modifications were made:
  ✏️some of the data types in the SQL schema needed to be changed to accomodate the values in the set (VARCHAR to MEDIUMTEXT, INT to BIGINT, INT to DATETIME)
  ✏️the original datetime values were in UNIX timestamps (epoch time) so were changed to datetime64(ns) to display it in proper datetime format (ISO strings)
  ✏️the --description-- and --title-- columns contain very very long strings and it causes issues with importing, so the comma within these columns were replaced with space ("," to " ")


## Filtering
Following the data cleaning, the dataset was imported into mysql for further filtering. For the first viz I focused on job titles that contain words like "data" and "engineer" and for the second viz I filtered the job description for "protein scientist". 
The filesize of these filtered csv files reduced to 10kb each, which are much more managable to upload to PowerBI.

## Visualisation
The filtered dataset was then imported into PowerBI to generate an interactive dashboard. 
The dashboard consists of a bar chart, a pie chart, a lineplot and a treemap.


The same dataset was also visualised using [Tableau](https://public.tableau.com/views/datajobs_tableaudashboard/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
