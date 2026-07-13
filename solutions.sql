SELECT
	au.au_id AS AUTHOR_ID,
	au.au_lname AS LAST_NAME,
	au.au_fname AS FIRST_NAME,
	t.title AS TITLE,
	pub.pub_name AS PUBLISHER
FROM authors AS au
INNER JOIN titleauthor as tau ON tau.au_id = au.au_id
INNER JOIN titles as t ON t.title_id = tau.title_id
INNER JOIN publishers as pub ON pub.pub_id = t.pub_id;

SELECT
	au.au_id AS AUTHOR_ID,
	au.au_lname AS LAST_NAME,
	au.au_fname AS FIRST_NAME,
	t.title AS TITLE,
	pub.pub_name AS PUBLISHER,
	COUNT(t.title_id) AS COUNT_TITLES
FROM authors AS au
INNER JOIN titleauthor as tau ON tau.au_id = au.au_id
INNER JOIN titles as t ON t.title_id = tau.title_id
INNER JOIN publishers as pub ON pub.pub_id = t.pub_id
GROUP BY au.au_id;

SELECT
	au.au_id AS AUTHOR_ID,
	au.au_lname AS LAST_NAME,
	au.au_fname AS FIRST_NAME,
	SUM(sl.qty) AS `TOTAL`
FROM authors AS au
LEFT JOIN titleauthor as tau ON tau.au_id = au.au_id
LEFT JOIN titles as t ON t.title_id = tau.title_id
LEFT JOIN publishers as pub ON pub.pub_id = t.pub_id
LEFT JOIN sales as sl ON sl.title_id = t.title_id
GROUP BY au.au_id
ORDER BY `TOTAL` DESC LIMIT 3;

SELECT
	au.au_id AS AUTHOR_ID,
	au.au_lname AS LAST_NAME,
	au.au_fname AS FIRST_NAME,
	COALESCE(SUM(sl.qty), 0) AS `TOTAL`
FROM authors AS au
LEFT JOIN titleauthor as tau ON tau.au_id = au.au_id
LEFT JOIN titles as t ON t.title_id = tau.title_id
LEFT JOIN publishers as pub ON pub.pub_id = t.pub_id
LEFT JOIN sales as sl ON sl.title_id = t.title_id
GROUP BY au.au_id
ORDER BY `TOTAL` DESC LIMIT 23;