-- Challenge 1

-- SELECT 
-- 	a.au_id AS "AUTHOR ID",
-- 	a.au_lname AS "LAST NAME",
-- 	a.au_fname AS "FIRST NAME",
-- 	t.title AS "Title",
-- 	p.pub_name AS "Publisher Name"
-- FROM titleauthor ta
-- JOIN authors a ON ta.au_id = a.au_id
-- JOIN titles t ON ta.title_id = t.title_id
-- JOIN publishers p ON t.pub_id = p.pub_id
-- ORDER BY
-- a.au_id,
-- t.title;

-- Challenge 2 

-- SELECT 
-- 	a.au_id AS "AUTHOR ID",
-- 	a.au_lname AS "LAST NAME",
-- 	a.au_fname AS "FIRST NAME",
-- 	p.pub_name AS "Publisher Name",
-- 	COUNT(*) AS "Title Count"
-- FROM titleauthor ta
-- JOIN authors a ON ta.au_id = a.au_id
-- JOIN titles t ON ta.title_id = t.title_id
-- JOIN publishers p ON t.pub_id = p.pub_id
-- GROUP BY
-- a.au_id,
-- a.au_lname,
-- a.au_fname,
-- p.pub_name
-- ORDER BY
-- a.au_id DESC,
-- t.title ;

-- Challenge 3 

-- SELECT
-- 	a.au_id AS "AUTHOR ID",
-- 	a.au_lname AS "LAST NAME",
-- 	a.au_fname AS "FIRST NAME",
-- 	COUNT(s.ord_num) AS "Total Sold"
-- FROM authors a
-- JOIN titleauthor ta ON a.au_id = ta.au_id
-- JOIN titles t ON ta.title_id = t.title_id
-- JOIN sales s ON t.title_id = s.title_id
-- GROUP BY
-- 	a.au_id,
-- 	a.au_lname,
-- 	a.au_fname
-- ORDER BY "Total Sold" DESC
-- LIMIT 3;

-- Challenge 4

SELECT
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  (
    SELECT COUNT(s.ord_num)
    FROM titleauthor ta
    JOIN titles t ON ta.title_id = t.title_id
    JOIN sales s ON t.title_id = s.title_id
    WHERE ta.au_id = a.au_id
  ) AS "TOTAL SOLD"
FROM authors a
ORDER BY "TOTAL SOLD" DESC;