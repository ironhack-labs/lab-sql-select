-- Query 1:
SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First name",
    titles.title AS "Title",
    publishers.pub_name AS "Publisher"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id, titles.title;

-- Query 2:
SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First name",
    publishers.pub_name AS "Publisher",
    COUNT(titleauthor.title_id) AS "Title Count"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id, publishers.pub_name;

-- Query 3:
SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First name",
    SUM(titles.price) AS "TOTAL"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;


-- Query 4:
SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First name",
    COALESCE(SUM(titles.price), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;
