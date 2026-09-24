--  CHALLENGE 1
SELECT 
	au.au_id AS `AUTHOR ID`, 
	au.au_lname AS `LAST NAME`,
	au.au_fname AS `FIRST NAME`,
	ti.title AS TITLE,
	pu.pub_name AS PUBLISHER
FROM authors AS au
INNER JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
INNER JOIN titles AS ti
	ON ta.title_id = ti.title_id
INNER JOIN publishers AS pu
	ON ti.pub_id = pu.pub_id;

--  CHALLENGE 2
SELECT 
	au.au_id AS `AUTHOR ID`, 
	au.au_lname AS `LAST NAME`,
	au.au_fname AS `FIRST NAME`,
	pu.pub_name AS PUBLISHER,
	COUNT(ta.title_id) AS `TITLE COUNT`
FROM authors AS au
INNER JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
INNER JOIN titles AS ti
	ON ta.title_id = ti.title_id
INNER JOIN publishers AS pu
	ON ti.pub_id = pu.pub_id
GROUP BY `AUTHOR ID`, PUBLISHER
ORDER BY `TITLE COUNT` DESC;

--  CHALLENGE 3
SELECT 
	au.au_id AS `AUTHOR ID`, 
	au.au_lname AS `LAST NAME`,
	au.au_fname AS `FIRST NAME`,
	SUM(ti.ytd_sales) AS `TOTAL`
FROM authors AS au
INNER JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
INNER JOIN titles AS ti
	ON ta.title_id = ti.title_id
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY `TOTAL` DESC
LIMIT 3;

--  CHALLENGE 4
SELECT 
	au.au_id AS `AUTHOR ID`, 
	au.au_lname AS `LAST NAME`,
	au.au_fname AS `FIRST NAME`,
	IFNULL(SUM(ti.ytd_sales), 0) AS `TOTAL`
FROM authors AS au
LEFT JOIN titleauthor AS ta
	ON au.au_id = ta.au_id
LEFT JOIN titles AS ti
	ON ta.title_id = ti.title_id
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY `TOTAL` DESC
