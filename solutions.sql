SELECT au_id, au_lname, au_fname FROM authors;

SELECT title_id FROM titleauthor;

SELECT title FROM titles;

SELECT pub_name FROM publishers;

-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
-- 
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

SELECT a.au_id AS "AUTHOR ID",
				 a.au_lname AS "LAST NAME",
				 a.au_fname AS "FIRST NAME",
				 t.title AS TITLE,
				 p.pub_name AS PUBLISHER
FROM authors AS a 
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:
SELECT a.au_id AS "AUTHOR ID",
				 a.au_lname AS "LAST NAME",
				 a.au_fname AS "FIRST NAME",
				 p.pub_name AS PUBLISHER, 
				COUNT(t.title) AS "TITLE COUNT"
FROM authors AS a 
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id DESC;

-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
-- 
-- Requirements:
-- 
-- Your output should have the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

SELECT a.au_id AS "AUTHOR ID",
				 a.au_lname AS "LAST NAME", 
				 a.au_fname AS "FIRST NAME", 
				 SUM (s.qty) AS "TOTAL"
FROM authors AS a
-- We connect the author with his books
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
-- We connect books with their actual sales.
INNER JOIN sales AS s ON ta.title_id = s.title_id
-- We group by the unique identity of the author
GROUP BY a.au_id
-- We sort by sales volume and limit to the TOP 3
ORDER BY TOTAL DESC LIMIT 3;


-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
-- Also order your results based on TOTAL from high to low.
SELECT a.au_id AS "AUTHOR ID",
				 a.au_lname AS "LAST NAME", 
				 a.au_fname AS "FIRST NAME", 
				 IFNULL (SUM(s.qty), 0) AS "TOTAL"
FROM authors AS a
-- LEFT JOIN to avoid losing authors without books
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
-- LEFT JOIN to avoid losing unsold books
LEFT JOIN sales AS s ON ta.title_id = s.title_id
-- We group by the author's unique ID 
GROUP BY a.au_id
-- We sort by sales volume
ORDER BY TOTAL DESC;