-- Challenge 1
-- Who Have Published What At Where?
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME ,t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS a
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id;

-- Challenge 2 
-- Who Have Published How Many At Where?
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME , p.pub_name AS PUBLISHER, count(t.title_id) AS TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY AUTHOR_ID, PUBLISHER
ORDER BY TITLE_COUNT DESC;

-- Challenge 3
-- Best Selling Authors
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, count(t.title_id) AS TOTAL
FROM authors AS a
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN titles AS t ON t.title_id = ta.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4
-- Best Selling Authors Ranking
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, count(t.title_id) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON t.title_id = ta.title_id

GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;





