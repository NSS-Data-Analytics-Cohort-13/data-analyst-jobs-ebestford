-- finding all data to refer to
SELECT *
FROM data_analyst_jobs;

1---Find how many rows are in data
SELECT COUNT(*)
FROM data_analyst_jobs;
--1793

2--Find the first 10 rows of the data
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--Company associated with 10th row, XTO Land Data Analyst

--Find how many postings in TN
SELECT COUNT(location)
FROM data_analyst_jobs 
WHERE location = 'TN'
--21

--Find how many postings in KY
SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location = 'KY'
--6

3--Find how many postings in TN OR KY (combinbed total)
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'
	OR location = 'KY';
--27

4--How many postings in TN have star ratings above 4
SELECT COUNT (star_rating)
FROM data_analyst_jobs
WHERE star_rating >4;
--416


5-- Find how many postings had reviews between 500 and 1000
SELECT COUNT (review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--151 postings

6--Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT company, location AS state, AVG (star_rating) AS av_rating
FROM data_analyst_jobs
GROUP BY location, company;
--INCOMPLETE-I think I have to use DESC or eliminate null values for answer with highest rating

7--Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;
--881

8--How many unique job titles are there for California companies?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location= 'CA';
--230

9--Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000;
--Don't believe this is complete, stuck on how to find average rating in this
--PART B
SELECT COUNT (company)
FROM data_analyst_jobs
WHERE review_count > 5000;
--184

10--Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
ORDER BY star_rating DESC, review_count DESC;
--Kaiser Permanente
--Unsure if this is correct, back on the average star rating question as before

11--Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT title
FROM data_analyst_jobs
WHERE title LIKE 'Analyst%';

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title LIKE 'Analyst%';
--12

12--How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT LIKE 'Analyst%'
	AND title NOT LIKE 'Analytics%';

SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst';
--only giving back analyst and analytics results..

	-- BONUS--
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 3?

SELECT COUNT(domain)
FROM data_analyst_jobs
WHERE days_since_posting > 21
	AND skill = 'SQL';
--11 
--Doesnt seem right
SELECT domain, days_since_posting, skill
FROM data_analyst_jobs
WHERE days_since_posting > 21
	AND skill = 'SQL';
--15
--Seems more right?
SELECT *
FROM data_analyst_jobs
WHERE days_since_posting > 21
	AND skill='SQL';
--Double checking data

SELECT domain