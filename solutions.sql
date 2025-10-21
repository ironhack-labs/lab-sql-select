--Challenge 1 - Who Have Published What At Where?
SELECT 
    a.au_id as "AUTHOR ID", 
    a.au_lname as "LAST NAME", 
    a.au_fname as "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHERS"
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id 
JOIN titles as t ON ta.title_id = t.title_id
JOIN publishers as p ON t.pub_id = p.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM
    authors a
JOIN
    titleauthor ta ON a.au_id = ta.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY
    "TITLE COUNT" DESC;

--Challenge 3 - Best Selling Authors
SELECT
	a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
	SUM(sa.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN sales AS sa ON ta.title_id = sa.title_id
GROUP BY 
	a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT
	a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
	coalesce(SUM(sa.qty),0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN sales AS sa ON ta.title_id = sa.title_id
GROUP BY 
	a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC;