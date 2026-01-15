-- Challenge 1 - Who Have Published What At Where?
SELECT titleauthor.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM titleauthor
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
INNER JOIN authors on authors.au_id = titleauthor.au_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT titleauthor.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS PUBLISHER, count(*) AS "TITLE COUNT"
FROM titleauthor
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
INNER JOIN authors on authors.au_id = titleauthor.au_id GROUP BY titleauthor.au_id, publishers.pub_name;

-- Challenge 3 - Best Selling Authors
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", SUM(titles.ytd_sales) AS TOTAL
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", IFNULL(SUM(titles.ytd_sales), 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC;