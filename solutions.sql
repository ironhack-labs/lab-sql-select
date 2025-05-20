SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id;


SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS PUBLISHER, COUNT(*)
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id DESC;

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(sales.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales ON sales.title_id = t.title_id
GROUP by a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales ON sales.title_id = t.title_id
GROUP by a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC