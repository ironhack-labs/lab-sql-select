SELECT a.au_id AS "AUTHOR ID", a.au_fname AS "FIRST NAME", a.au_lname AS "LAST NAME", t.title AS "TITLE", p.pub_name AS publisher
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id;

SELECT a.au_id AS "AUTHOR ID", a.au_fname AS "FIRST NAME", a.au_lname AS "LAST NAME", p.pub_name AS publisher, COUNT(t.title_id) AS title_count
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY title_count DESC;

SELECT a.au_id AS "AUTHOR ID", a.au_fname AS "FIRST NAME", a.au_lname AS "LAST NAME", SUM(s.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC LIMIT 3;

SELECT a.au_id AS "AUTHOR ID", a.au_fname AS "FIRST NAME", a.au_lname AS "LAST NAME",
CASE 
   WHEN SUM(s.qty) IS NULL THEN 0 
   ELSE SUM(s.qty) 
END AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC;

