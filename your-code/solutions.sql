SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id;


SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title) AS "TITLE COUNT"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY
    a.au_id,
    a.au_lname, 
    a.au_fname, 
    p.pub_name;
	

SELECT
   a.au_id AS "AUTHOR ID",
   a.au_lname AS "LAST NAME",
   a.au_fname AS "FIRST NAME",
   SUM(s.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY
   a.au_id,
   a.au_lname, 
   a.au_fname
ORDER BY 
   SUM(s.qty) DESC
LIMIT 3;

SELECT
   a.au_id AS "AUTHOR ID",
   a.au_lname AS "LAST NAME",
   a.au_fname AS "FIRST NAME",
    CASE 
       WHEN SUM(s.qty) IS NULL THEN 0
       ELSE SUM(s.qty)
   END AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY
   a.au_id,
   a.au_lname, 
   a.au_fname;

   