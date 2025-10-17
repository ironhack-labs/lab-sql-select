-- SQL Solutions for Lab | SQL Select

-- Challenge 1 - Who Have Published What At Where?
-- This query joins various tables to figure out what titles each author has published at which publishers.

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- This query counts how many titles each author has published at each publisher.

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id;

-- Challenge 3 - Best Selling Authors
-- This query finds the top 3 authors who have sold the highest number of titles.

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME",
    SUM(t.ytd_sales) AS "TOTAL"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY SUM(t.ytd_sales) DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
-- This query displays all authors with their total sales, including those with 0 sales.

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(t.ytd_sales), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY SUM(t.ytd_sales) DESC;