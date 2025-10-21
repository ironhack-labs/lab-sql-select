-- Challenge 1 - Who Have Published What At Where?

SELECT au.au_id AS AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME, ti.title as TITLE, p.pub_name AS PUBLISHER
FROM authors AS au
JOIN titleauthor as ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ta.title_id = ti.title_id
JOIN publishers AS p ON ti.pub_id = p.pub_id;


--  Challenge 2 - Who Have Published How Many At Where?

SELECT au.au_id AS AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, COUNT(ta.title_id) AS TITLE_COUNT
FROM authors AS au
JOIN titleauthor as ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ta.title_id = ti.title_id
JOIN publishers AS p ON ti.pub_id = p.pub_id
GROUP BY ta.title_id;

-- Challenge 3 - Best Selling Authors

SELECT au.au_id AS AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME, SUM(s.qty) AS Total_sold
FROM authors AS au
JOIN titleauthor as ta ON au.au_id = ta.au_id
JOIN sales AS s ON ta.title_id = s.title_id
GROUP BY au.au_id
ORDER BY Total_sold DESC LIMIT 5;


-- Challenge 4 - Best Selling Authors Ranking

SELECT 
  au.au_id AS AUTHOR_ID,
  au.au_lname AS LAST_NAME,
  au.au_fname AS FIRST_NAME,
  COALESCE(SUM(s.qty), 0) AS TOTAL_SOLD,
  DENSE_RANK() OVER (ORDER BY COALESCE(SUM(s.qty), 0) DESC) AS SALES_RANK
FROM authors AS au
LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname
ORDER BY SALES_RANK;


