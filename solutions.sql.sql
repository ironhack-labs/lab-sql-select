--CHALLENGE 1

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id;

-- CHALLENGE 2

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
	COUNT(*) AS "TITLE COUNT"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id;

--CHALLEGE 3

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
	SUM(t.ytd_sales) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
GROUP by a.au_id, a.au_fname = a.au_fname
ORDER by TOTAL DESC LIMIT 3;

--CHALLEGE 4

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
	SUM(t.ytd_sales) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
GROUP by a.au_id, a.au_fname = a.au_fname
ORDER by TOTAL DESC;



