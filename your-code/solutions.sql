SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id and
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id;
	
	
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    publishers.pub_name AS "PUBLISHER",
    COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY
    authors.au_lname,
    publishers.pub_name;
	

SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
	COUNT(titles.title_id) AS "TOTAL"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
order by TOTAL desc
LIMIT 3;


SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
	COUNT(titles.title_id) AS "TOTAL"
FROM authors
Left JOIN titleauthor ON authors.au_id = titleauthor.au_id
Left JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
order by TOTAL desc



