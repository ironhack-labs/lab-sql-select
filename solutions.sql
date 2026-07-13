

### Challenge 1
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors AS a
INNER JOIN titleauthor AS ta on a.au_id = ta.au_id
INNER JOIN titles AS t on ta.title_id = t.title_id
INNER JOIN publishers AS p on t.pub_id = p.pub_id;



### Challenge 2
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', p.pub_name AS 'PUBLISHER', COUNT(t.title) AS 'TITLE COUNT'
FROM authors AS a
INNER JOIN titleauthor AS ta on a.au_id = ta.au_id
INNER JOIN titles AS t on ta.title_id = t.title_id
INNER JOIN publishers AS p on t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY COUNT(t.title) DESC;


### Challenge 3
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', SUM(s.qty) as 'TOTAL'
FROM authors AS a
INNER JOIN titleauthor AS ta on a.au_id = ta.au_id
INNER JOIN titles AS t on ta.title_id = t.title_id
INNER JOIN sales AS s on ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC, a.au_lname ASC
LIMIT 3;


### Challenge
SELECT 
	a.au_id AS 'AUTHOR ID', 
	a.au_lname AS 'LAST NAME', 
	a.au_fname AS 'FIRST NAME', 
	IFNULL(SUM(s.qty), 0) as 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta on a.au_id = ta.au_id
LEFT JOIN titles AS t on ta.title_id = t.title_id
LEFT JOIN sales AS s on ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC;