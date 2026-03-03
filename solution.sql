/* tl =  titles , t = titleauthor, a = authors p = publishers */
SELECT 
	t.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	tl.title AS "TITLE",
	p.pub_name AS PUBLISER
FROM titleauthor AS t
JOIN authors AS a ON a.au_id = t.au_id
JOIN titles AS tl ON tl.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = tl.pub_id
ORDER BY
t.au_id;

/* SECOND */
SELECT 
	t.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	p.pub_name AS PUBLISER,
	COUNT(*) AS "TITLE COUNT"
FROM titleauthor AS t
JOIN authors AS a ON a.au_id = t.au_id
JOIN titles AS tl ON tl.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = tl.pub_id
GROUP BY
	t.au_id,
	p.pub_name
Order BY
	t.au_id DESC;

	
/* THIRD: t = titleauthor, tl =  titles , a = authors p = publishers, s= stores, sl = sales */
SELECT 
	t.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	sl.title_id AS "TITLE ID",
	SUM(sl.qty) AS "QUANTITY"
	
FROM titleauthor AS t
JOIN authors AS a ON a.au_id = t.au_id
JOIN titles AS tl ON tl.title_id = t.title_id
JOIN sales AS sl ON sl.title_id = tl.title_id
GROUP BY
	a.au_id
ORDER BY
	"QUANTITY" DESC
	LIMIT 3;

	
	/* FOURTH: t = titleauthor, tl =  titles , a = authors p = publishers, s= stores, sl = sales */
SELECT 
	t.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	sl.title_id AS "TITLE ID",
	SUM(sl.qty) AS "TOTAL QUANTITY"
	
FROM titleauthor AS t
JOIN authors AS a ON a.au_id = t.au_id
JOIN titles AS tl ON tl.title_id = t.title_id
LEFT JOIN sales AS sl ON sl.title_id = tl.title_id
GROUP BY
	a.au_id
ORDER BY
	"AUTHOR ID" DESC;
