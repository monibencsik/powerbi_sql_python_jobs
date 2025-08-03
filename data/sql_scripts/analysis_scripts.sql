/*
==================================================
This script contains filters to narrow down the database

MBencsik 03Aug2025
==================================================
*/

SELECT 
	pay_period, 
    ROUND(AVG(max_salary),2) AS max_salary,
    ROUND(AVG(min_salary),2) AS min_salary
FROM job_postings
GROUP BY pay_period
ORDER BY max_salary DESC
;

SELECT 
    title,
    description,
    max_salary,
    work_type,
    formatted_work_type,
    remote_allowed,
    application_type,
    formatted_experience_level,
    skills_desc
FROM job_postings
WHERE title LIKE '%data%'
ORDER BY max_salary DESC
LIMIT 50
;

SELECT 
    title,
    CASE
		WHEN pay_period = 'yearly' THEN max_salary
        WHEN pay_period = 'monthly' THEN max_salary * 12
        WHEN pay_period = 'weekly' THEN max_salary * 52
		WHEN pay_period = 'hourly' THEN max_salary * 40 * 52
		ELSE 0
	END AS y_max_salary,
    CASE
		WHEN pay_period = 'yearly' THEN min_salary
        WHEN pay_period = 'monthly' THEN min_salary * 12
        WHEN pay_period = 'weekly' THEN min_salary * 52
		WHEN pay_period = 'hourly' THEN min_salary * 40 * 52
		ELSE 0
	END AS y_min_salary,
    pay_period,
    formatted_work_type,
    CASE 
		WHEN remote_allowed = '1' THEN 'Yes'
        WHEN remote_allowed = '0' THEN 'No'
	END AS remote_allowed,
    application_type,
    formatted_experience_level,
    posting_domain, 
    listed_time
FROM job_postings
WHERE title LIKE '%data%'
AND title LIKE '%engineer%'
AND title NOT LIKE '%clinical%'
ORDER BY y_max_salary DESC
LIMIT 100
;

SELECT 
    title,
	ROUND(CASE
			WHEN pay_period = 'yearly' THEN max_salary
			WHEN pay_period = 'monthly' THEN max_salary * 12
			WHEN pay_period = 'weekly' THEN max_salary * 52
			WHEN pay_period = 'hourly' THEN max_salary * 40 * 52
			ELSE 0
	END,0) AS y_max_salary,
    ROUND(CASE
			WHEN pay_period = 'yearly' THEN min_salary
			WHEN pay_period = 'monthly' THEN min_salary * 12
			WHEN pay_period = 'weekly' THEN min_salary * 52
			WHEN pay_period = 'hourly' THEN min_salary * 40 * 52
			ELSE 0
	END,0) AS y_min_salary,
    pay_period,
    formatted_work_type,
    CASE 
		WHEN remote_allowed = '1' THEN 'Yes'
        WHEN remote_allowed = '0' THEN 'No'
	END AS remote_allowed,
    application_type,
    formatted_experience_level,
    posting_domain,
    listed_time
FROM job_postings
WHERE description LIKE '%spectrom%'
OR description LIKE '%protein%'
ORDER BY y_max_salary DESC
LIMIT 100
;

SELECT DISTINCT(pay_period)
FROM job_postings
;

SELECT *
FROM job_postings
;

