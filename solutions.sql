-- Challenge 1 - Who have published what at where? ----

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id 
JOIN publishers AS p ON t.pub_id = p.pub_id





























