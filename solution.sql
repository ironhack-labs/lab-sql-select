-- CHALLENGE 1
SELECT
	titleauthor.au_id AS AUTHOR_ID,
	authors.au_lname AS LAST_NAME,
	authors.au_fname AS FIRST_NAME,
	titles.title AS TITLE,
	publishers.pub_name AS PUBLISHER
FROM
	titleauthor
JOIN 
	authors
	ON AUTHOR_ID = authors.au_id
JOIN
	titles
	ON titleauthor.title_id = titles.title_id
JOIN
	publishers
	ON titles.pub_id = publishers.pub_id;


-- CHALLENGE 2
SELECT
	titleauthor.au_id AS AUTHOR_ID,
	authors.au_lname AS LAST_NAME,
	authors.au_fname AS FIRST_NAME,
	publishers.pub_name AS PUBLISHER,
	COUNT(titles.title) AS TITLE_COUNT
FROM
	titleauthor
JOIN 
	authors
	ON AUTHOR_ID = authors.au_id
JOIN
	titles
	ON titleauthor.title_id = titles.title_id
JOIN
	publishers
	ON titles.pub_id = publishers.pub_id
GROUP BY
	AUTHOR_ID, PUBLISHER
ORDER BY
	TITLE_COUNT DESC, AUTHOR_ID DESC;


-- CHALLENGE 3
SELECT
	authors.au_id AS AUTHOR_ID,
	authors.au_lname AS LAST_NAME,
	authors.au_fname AS FIRST_NAME,
	SUM(titles.ytd_sales) AS TOTAL_SOLD
FROM
	authors
LEFT JOIN 
	titleauthor
	ON AUTHOR_ID = titleauthor.au_id
JOIN
	titles
	ON titleauthor.title_id = titles.title_id
GROUP BY
	AUTHOR_ID
ORDER BY
	TOTAL_SOLD DESC
LIMIT
	3;


-- CHALLENGE 4
SELECT
	authors.au_id AS AUTHOR_ID,
	authors.au_lname AS LAST_NAME,
	authors.au_fname AS FIRST_NAME,
	COALESCE(SUM(titles.ytd_sales), 0) AS TOTAL_SOLD
FROM
	authors
JOIN 
	titleauthor
	ON AUTHOR_ID = titleauthor.au_id
LEFT JOIN
	titles
	ON titleauthor.title_id = titles.title_id
GROUP BY
	AUTHOR_ID
ORDER BY
	TOTAL_SOLD DESC;
