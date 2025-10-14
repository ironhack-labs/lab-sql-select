-- First Query
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME",
	   au.au_fname AS "FIRST NAME", ti.title AS "TITLE",
	   pu.pub_name AS "PUBLISHER"
FROM authors AS au

JOIN titleauthor AS ta ON ta.au_id = au.au_id
JOIN titles as ti ON ti.title_id = ta.title_id
JOIN publishers AS pu ON pu.pub_id = ti.pub_id;

-- Second Query 
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", 
       au.au_fname AS "FIRST NAME", pu.pub_name AS "PUBLISHER",
	   COUNT(ti.title_id) AS "TITLE COUNT"
FROM authors AS au

JOIN titleauthor AS ta ON ta.au_id = au.au_id
JOIN titles as ti ON ti.title_id = ta.title_id
JOIN publishers AS pu ON pu.pub_id = ti.pub_id

GROUP BY au.au_id, au.au_lname, au.au_fname, pu.pub_name
ORDER BY au.au_id DESC;

-- Third Query 
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME",
       au.au_fname AS "FIRST NAME", SUM(sa.qty) AS "TOTAL"
FROM authors AS au

JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ti.title_id = ta.title_id
JOIN sales AS sa ON sa.title_id = ti.title_id

GROUP BY au.au_id, au.au_lname, au.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3;

-- Fourth QUERY
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME", COALESCE(SUM(sa.qty), 0) AS "TOTAL"
FROM authors au

LEFT JOIN titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN sales sa ON ta.title_id = sa.title_id
GROUP BY au.au_id
ORDER BY "TOTAL" DESC;
