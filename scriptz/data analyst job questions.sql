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
WHERE location = 'TN';
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
SELECT company 
FROM data_analyst_jobs
WHERE av_rating > 5000;
--INCOMPLETE