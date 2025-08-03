/*
==================================================
In this job listing analysis project, the database was downloaded from
https://huggingface.co/datasets/xanderios/linkedin-job-postings/tree/main

The database was cleaned and processed with python before importing into MySQL 
MBencsik 03Aug2025
==================================================
*/

USE job_postings;

DROP TABLE job_postings;

CREATE TABLE job_postings(
    job_id BIGINT,
    company_id FLOAT,
    title MEDIUMTEXT,
    description MEDIUMTEXT,
    max_salary FLOAT,
    med_salary FLOAT,
    min_salary FLOAT,
    pay_period VARCHAR(50),
    formatted_work_type VARCHAR(50),
    location MEDIUMTEXT,
    applies FLOAT,
    original_listed_time DATETIME,
    remote_allowed FLOAT,
    views FLOAT,
    job_posting_url MEDIUMTEXT,
    application_url MEDIUMTEXT,
    application_type VARCHAR(50),
    expiry DATETIME,
    closed_time DATETIME,
    formatted_experience_level VARCHAR(50),
    skills_desc MEDIUMTEXT,
    listed_time DATETIME,
    posting_domain VARCHAR(100),
    sponsored INT,
    work_type VARCHAR(50),
    currency VARCHAR(10),
    compensation_type VARCHAR(50),
    scraped DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';
    
SET GLOBAL local_infile = true; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/job_postings/job_postings_propertime.csv' 
	INTO TABLE job_postings 
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' 
    IGNORE 1 LINES
;

