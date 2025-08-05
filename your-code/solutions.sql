-- Challenge 1
SELECT
auth.au_id AS AUTHOR_ID,
auth.au_lname AS LAST_NAME,
auth.au_fname AS FIRST_NAME,
t.title AS TITLE,
publ.pub_name AS PUBLISHER
FROM authors AS auth 
JOIN titleauthor AS ta ON auth.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS publ ON t.pub_id = publ.pub_id;

-- Challenge 2
SELECT
auth.au_id AS AUTHOR_ID,
auth.au_lname AS LAST_NAME,
auth.au_fname AS FIRST_NAME,
publ.pub_name AS PUBLISHER,
COUNT(t.title) AS TITLE_COUNT
FROM authors AS auth 
JOIN titleauthor AS ta ON auth.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS publ ON t.pub_id = publ.pub_id
GROUP BY auth.au_id;
-- Challenge 3
SELECT
auth.au_id AS AUTHOR_ID,
auth.au_lname AS LAST_NAME,
auth.au_fname AS FIRST_NAME,
SUM(sal.qty) AS TOTAL_SOLD
FROM authors AS auth
JOIN titleauthor AS ta ON auth.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS sal ON t.title_id = sal.title_id
GROUP BY auth.au_id ORDER BY TOTAL_SOLD DESC LIMIT 3;
-- Challenge 
SELECT
  auth.au_id AS AUTHOR_ID,
  auth.au_lname AS LAST_NAME,
  auth.au_fname AS FIRST_NAME,
  IFNULL(SUM(sal.qty), 0) AS TOTAL
FROM authors AS auth
LEFT JOIN titleauthor AS ta ON auth.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS sal ON t.title_id = sal.title_id
GROUP BY auth.au_id, auth.au_lname, auth.au_fname
ORDER BY TOTAL DESC;




