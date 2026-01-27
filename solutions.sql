
--Challenge 1 - Who Have Published What At Where?
--In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    t.title AS 'TITLE', 
    p.pub_name AS 'PUBLISHER'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

--Challenge 2 - Who Have Published How Many At Where?
--Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:
SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    p.pub_name AS 'PUBLISHER',
    COUNT(t.title_id) AS 'TITLE COUNT'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY a.au_id DESC, p.pub_name DESC;

-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT
    a.au_id AS 'AUTHOR ID',
	a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME',
	SUM(s.qty) AS 'TOTAL'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.
SELECT
    a.au_id AS 'AUTHOR ID',
	a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME',
	IFNULL(SUM(s.qty), 0)  AS 'TOTAL'
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;