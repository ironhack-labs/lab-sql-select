/*
## Challenge 1 - Who Have Published What At Where?
*/

SELECT
    ta.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;


/*
## Challenge 2 - Who Have Published How Many At Where?
*/

SELECT
    ta.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    p.pub_name AS PUBLISHER,
    COUNT(t.title_id) AS TITLE_COUNT
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY ta.au_id, a.au_lname, a.au_fname, p.pub_name;


/*
## Challenge 3 - Best Selling Authors
*/

SELECT
    ta.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(t.ytd_sales) AS TOTAL
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON t.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3


/*
## Challenge 4 - Best Selling Authors Ranking
*/

SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    COALESCE(SUM(t.ytd_sales), 0) AS TOTAL
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
