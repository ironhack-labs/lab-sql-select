-- Challenge 1

SELECT
	ta.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	t.title AS "TITLE",
	p.pub_name AS "PUBLISHER"
FROM titleauthor ta
JOIN authors  a ON ta.au_id = a.au_id
JOIN titles t ON t.title_id=ta.title_id
JOIN publishers p ON p.pub_id=t.pub_id


-- Challenge 2

SELECT
	ta.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	t.title AS "TITLE",
	p.pub_name AS "PUBLISHER",
	zz. "TITLE COUNT"
FROM titleauthor ta
JOIN authors  a ON ta.au_id = a.au_id
JOIN titles t ON t.title_id=ta.title_id
JOIN publishers p ON p.pub_id=t.pub_id
LEFT JOIN (SELECT ta.au_id, t.pub_id, COUNT(ta.title_id) AS "TITLE COUNT"
FROM  titleauthor ta
JOIN titles t ON ta.title_id=t.title_id
GROUP by ta.au_id, t.pub_id) zz ON zz.au_id = ta.au_id AND zz.pub_id = t.pub_id


-- Challenge 3

SELECT
	ta.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	COUNT(ta.title_id) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON ta.au_id=a.au_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3


-- Challenge 4

SELECT
	ta.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	COUNT(ta.title_id) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON ta.au_id=a.au_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC


