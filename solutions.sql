-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. 
--Author ID:
--Last Name, First Name: employee (names and emp_id), authors,
--Title: titleauthour (title_id), sales (title_id), titles(title_id and title)
--Publisher: employee (pub_id), publishers (id and name), title (pub_id), pub_Info(pub_id)

SELECT a.au_id AS 'AUTHOR ID', 
       a.au_lname AS 'LAST NAME', 
       a.au_fname AS 'FIRST NAME', 
       t.title AS TITLE, 
       p.pub_name AS PUBLISHER
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id;

--Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
SELECT a.au_id AS 'AUTHOR ID', 
       a.au_lname AS 'LAST NAME', 
       a.au_fname AS 'FIRST NAME', 
       p.pub_name AS PUBLISHER,
	   COUNT(t.title) AS 'TITLE COUNT' 
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;

--Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? 
SELECT a.au_id AS 'AUTHOR ID', 
       a.au_lname AS 'LAST NAME', 
       a.au_fname AS 'FIRST NAME', 
	   SUM(s.qty) AS 'TOTAL'
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY SUM(s.qty) DESC
LIMIT 3;

--Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id AS 'AUTHOR ID',
       a.au_lname AS 'LAST NAME',
       a.au_fname AS 'FIRST NAME',
       COALESCE(SUM(t.ytd_sales), 0) AS 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY 'TOTAL' DESC;