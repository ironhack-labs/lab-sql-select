-- 1.
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM
    authors
JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN
    titles ON titleauthor.title_id = titles.title_id
JOIN
    publishers ON titles.pub_id = publishers.pub_id
ORDER BY
	authors.au_id ASC , publishers.pub_name DESC;
	
-- 2.
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    publishers.pub_name AS "PUBLISHER",
	COUNT(titles.title_id) AS "TITLE COUNT"
FROM
    authors
JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN
    titles ON titleauthor.title_id = titles.title_id
JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY
	authors.au_id, publishers.pub_name
ORDER BY
	authors.au_id DESC , publishers.pub_name DESC;
	
-- sanity check
SELECT
    (SELECT COUNT(*) FROM titleauthor) AS total_titleauthor_count,
    SUM(T."TITLE COUNT") AS total_titles_from_grouped_query
FROM
    (SELECT
        authors.au_id AS "AUTHOR ID",
        COUNT(titles.title_id) AS "TITLE COUNT"
    FROM
        authors
    JOIN
        titleauthor ON authors.au_id = titleauthor.au_id
    JOIN
        titles ON titleauthor.title_id = titles.title_id
    GROUP BY
        authors.au_id
    ) AS T;
	
-- 3.
SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	COUNT(sales.title_id) AS total
FROM
	authors
JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
JOIN
	titles ON titleauthor.title_id = titles.title_id
JOIN
	sales ON titles.title_id = sales.title_id
GROUP BY
	authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY
	total DESC
LIMIT 3;


SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	COALESCE(COUNT(sales.title_id), 0) AS total
FROM
	authors
LEFT JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
	titles ON titleauthor.title_id = titles.title_id
LEFT JOIN
	sales ON titles.title_id = sales.title_id
GROUP BY
	authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY
	total DESC;