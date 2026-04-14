-- Challenge 1 - Who have published what at where? ----

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id 
JOIN publishers AS p ON t.pub_id = p.pub_id;

-- Challenge 2 - Who have published how many at where? ---

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', p.pub_name AS 'PUBLISHER', COUNT(ta.title_id) AS 'TITLE COUNT'
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id 
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY p.pub_name, a.au_id; 

-- Challenge 3 - Best Selling authors ---

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COUNT(ta.title_id) AS 'TOTAL'
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id 
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking ---

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', IFNULL(COUNT(ta.title_id), 0) AS 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id 
LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id
ORDER BY TOTAL DESC






















