--  CHALLENGE 1
SELECT  a.au_id AS "AUTHOR ID",  a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS TITLE, p.pub_name AS PUBLISHER 
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON ta.title_id = t.title_id
JOIN publishers as p ON t.pub_id = p.pub_id;

-- CHALLENGE 2
SELECT  a.au_id AS "AUTHOR ID",  a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS PUBLISHER, COUNT(*) as "TITLE COUNT"
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON ta.title_id = t.title_id
JOIN publishers as p ON t.pub_id = p.pub_id
GROUP BY  p.pub_id, a.au_id;

-- CHALLENGE 3
SELECT  a.au_id AS "AUTHOR ID",  a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(t.ytd_sales) AS "TOTAL"
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY "TOTAL"  DESC
LIMIT 3;

-- CHALLENGE 4
SELECT  a.au_id AS "AUTHOR ID",  a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(SUM(t.ytd_sales), 0) as "TOTAL"
FROM authors as a
LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
LEFT JOIN titles as t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY "TOTAL"  DESC;

