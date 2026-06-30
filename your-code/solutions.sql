SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id;--Q1

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, count(t.title) AS TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY count(t.title)DESC, a.au_id DESC;--Q2

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, sum(t.ytd_sales) AS TOTAL
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;--Q3

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, sum(IFNULL(t.ytd_sales,0)) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;--Q4