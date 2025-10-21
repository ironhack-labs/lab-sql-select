-- Challenge 1. Who published what at where?
SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME", 
	titles.title AS "TITLE", 
	publishers.pub_name AS "PUBLISHER"

FROM authors 

JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id

ORDER BY authors.au_lname, authors.au_fname, titles.title;


-- Challenge 2. How many titles each author published at each publisher?
SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	publishers.pub_name AS "PUBLISHER",
	COUNT(DISTINCT titleauthor.title_id) AS "TITLE COUNT"

FROM authors

JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id

GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name

ORDER BY authors.au_lname, authors.au_fname, "TITLE COUNT" DESC;


--Challenge 3 — Top 3 best-selling authors
SELECT
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  SUM(s.qty) AS "TOTAL"
  
FROM authors a
JOIN titleauthor ta ON ta.au_id = a.au_id
JOIN titles t ON t.title_id = ta.title_id
JOIN sales s ON s.title_id = t.title_id

GROUP BY a.au_id, a.au_lname, a.au_fname

ORDER BY "TOTAL" DESC

LIMIT 3;


--Challenge 4 — Best-selling authors ranking (include those with zero sales)
SELECT
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  COALESCE(SUM(s.qty),0) AS "TOTAL"
  
FROM authors a

LEFT JOIN titleauthor ta ON ta.au_id = a.au_id
LEFT JOIN titles t ON t.title_id = ta.title_id
LEFT JOIN sales s ON s.title_id = t.title_id

GROUP BY a.au_id, a.au_lname, a.au_fname

ORDER BY "TOTAL" DESC, a.au_lname, a.au_fname;