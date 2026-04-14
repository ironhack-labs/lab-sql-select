--Challenge 1

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

--Challenge 2

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name;             -- 25 instances
	
SELECT COUNT(title_id)
FROM titleauthor;           --25 instances

--Challenge 3

SELECT 
    a.au_id,
    a.au_lname,
    a.au_fname,
    COUNT(*) AS total_titles
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY total_titles DESC
LIMIT 3;



