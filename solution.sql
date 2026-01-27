-- Challenge 1
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors as a
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id
ORDER BY a.au_id;

-- Challenge 2
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, COUNT(t.title)
FROM authors AS a
JOIN publishers AS p ON p.pub_id = t.pub_id
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN titles AS t ON ta.title_id = t.title_id
GROUP BY title
ORDER BY a.au_id DESC;

-- Challenge 3
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, COUNT(t.title) AS SOLD_TITLES
FROM authors AS a
JOIN sales AS s ON s.title_id = t.title_id
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN titles AS t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY COUNT(t.title) DESC
LIMIT 3;

-- Challenge 4
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, COUNT(s.title_id) AS SOLD_TITLES
FROM authors AS a
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY SOLD_TITLES DESC;
