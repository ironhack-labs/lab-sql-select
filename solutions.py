SELECT
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    SUM(sales.qty) AS TOTAL
FROM authors
INNER JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
INNER JOIN titles
    ON titles.title_id = titleauthor.title_id
INNER JOIN sales
    ON sales.title_id = titles.title_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY TOTAL DESC;


SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM authors
INNER JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
INNER JOIN titles
    ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
    ON titles.pub_id = publishers.pub_id;



SELECT
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name,
    COUNT(titles.title_id) AS total_titles
FROM authors
INNER JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
INNER JOIN titles
    ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
    ON titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_id,
    publishers.pub_name
ORDER BY total_titles DESC;


SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty
FROM authors
INNER JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
INNER JOIN titles
    ON titles.title_id = titleauthor.title_id
INNER JOIN sales
    ON sales.title_id = titles.title_id;