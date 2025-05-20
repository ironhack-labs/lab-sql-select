-- Challenge 1 - Who Have Published What At Where?
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS PUBLISHER
FROM authors as a 
	INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
	INNER JOIN titles as t ON ta.title_id = t.title_id
	INNER JOIN publishers as p ON t.pub_id = p.pub_id;
	
-- Challenge 2 - Who Have Published How Many At Where?
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS PUBLISHER, COUNT(t.title_id) AS "TITLE COUNT"
FROM authors as a 
	INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
	INNER JOIN titles as t ON ta.title_id = t.title_id
	INNER JOIN publishers as p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY "AUTHOR ID" DESC;

-- Challenge 3 - Best Selling Authors
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL"
FROM authors as a
	INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
	INNER JOIN sales as s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", 
	CASE
		WHEN SUM(s.qty) IS NULL THEN 0
		ELSE SUM(s.qty)
	END AS "TOTAL"
FROM authors as a
	LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
	LEFT JOIN sales as s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC;

