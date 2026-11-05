--Challenge 1 - Who Have Published What At Where?
SELECT
	au.au_id AS [AUTHOR ID]
	, au.au_lname AS [LAST NAME]
	, au.au_fname AS [FIRST NAME]
	, tl.title AS TITLE
	, pu.pub_name AS PUBLISHER
FROM authors au
INNER JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
INNER JOIN titles AS tl
	ON ta.title_id = tl.title_id
INNER JOIN publishers AS pu
	ON tl.pub_id = pu.pub_id;
	
--Challenge 2 - Who Have Published How Many At Where?
SELECT
	au.au_id AS [AUTHOR ID]
	, au.au_lname AS [LAST NAME]
	, au.au_fname AS [FIRST NAME]
	, pu.pub_name AS PUBLISHER
	, COUNT(DISTINCT tl.title) AS [TITLE COUNT]
FROM authors au
INNER JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
INNER JOIN titles AS tl
	ON ta.title_id = tl.title_id
INNER JOIN publishers AS pu
	ON tl.pub_id = pu.pub_id
GROUP BY au.au_id
	, au.au_lname
	, au.au_fname
	, pu.pub_name;

--Challenge 3 - Best Selling Authors
SELECT
	au.au_id AS [AUTHOR ID]
	, au.au_lname AS [LAST NAME]
	, au.au_fname AS [FIRST NAME]
	, SUM(IFNULL(sl.qty, 0)) AS [TOTAL]
FROM authors au
LEFT JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
LEFT JOIN titles AS tl
	ON ta.title_id = tl.title_id
LEFT JOIN sales AS sl
	ON ta.title_id = sl.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname
ORDER BY [TOTAL] DESC
LIMIT 3;

--Challenge 4 - Best Selling Authors Ranking
SELECT
	au.au_id AS [AUTHOR ID]
	, au.au_lname AS [LAST NAME]
	, au.au_fname AS [FIRST NAME]
	, SUM(IFNULL(sl.qty, 0)) AS [TOTAL]
FROM authors au
LEFT JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
LEFT JOIN titles AS tl
	ON ta.title_id = tl.title_id
LEFT JOIN sales AS sl
	ON ta.title_id = sl.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname
ORDER BY [TOTAL] DESC;