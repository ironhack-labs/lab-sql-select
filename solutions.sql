SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",	
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
	

FROM authors AS a

JOIN titleauthor as ta
	ON a.au_id = ta.au_id

JOIN titles AS t
    ON ta.title_id = t.title_id
	
JOIN publishers AS p
	ON t.pub_id = p.pub_id

 /*Challenge 2*/
 SELECT
	a.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",	
    p.pub_name AS "PUBLISHER",
	COUNT(t.title_id) AS "NUMBER OF BOOKS"
	
FROM authors AS a

JOIN titleauthor as ta
	ON a.au_id = ta.au_id

JOIN titles AS t
    ON ta.title_id = t.title_id
	
JOIN publishers AS p
	ON t.pub_id = p.pub_id

GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name

ORDER BY "NUMBER OF BOOKS" DESC;

 /*Challenge 3*/
SELECT
	a.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	SUM(CAST(s.qty AS INTEGER)) AS "TOTAL"

FROM authors AS a

JOIN titleauthor as ta
	ON a.au_id = ta.au_id

JOIN titles AS t
    ON ta.title_id = t.title_id

JOIN sales AS s
	ON t.title_id = s.title_id

GROUP BY a.au_id, a.au_fname, a.au_lname

ORDER BY "TOTAL" DESC, a.au_lname ASC

LIMIT 3;

 /*Challenge 4*/
 SELECT
    a.au_id AS "AUTHOR ID",
    a.au_fname AS "FIRST NAME",
    a.au_lname AS "LAST NAME",
    SUM(CAST(s.qty AS INTEGER)) AS "TOTAL"

FROM authors AS a

LEFT JOIN titleauthor AS ta
    ON a.au_id = ta.au_id

LEFT JOIN sales AS s
    ON ta.title_id = s.title_id

GROUP BY
    a.au_id,
    a.au_fname,
    a.au_lname

ORDER BY "TOTAL" DESC;