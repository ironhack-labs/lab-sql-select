--Challenge 1 Who published where?
SELECT a.au_id AS "Author ID",a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id 
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
ORDER BY a.au_id;
--Challenge 2 Who published where and how many?
SELECT a.au_id AS "Author ID",a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", COUNT(*) AS "TITLE COUNT"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id 
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id, p.pub_id ASC;
--Challenge 3 Best Selling authors
SELECT a.au_id AS "Author ID",a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id == ta.au_id 
JOIN sales AS s ON s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;
--Challenge 4 Best Selling Ranking
SELECT a.au_id AS "Author ID",a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(SUM(s.qty),0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id == ta.au_id
LEFT JOIN sales AS s ON s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC;


