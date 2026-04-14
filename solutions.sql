-- Challenge 1
SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', t.title AS TITLE, p.pub_name AS PUBLISHER 
FROM authors AS au
JOIN titleauthor as ta ON au.au_id = ta.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id;


-- Challenge 2
CREATE TEMP TABLE tab1 AS SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS au
JOIN titleauthor as ta ON au.au_id = ta.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id;

SELECT "AUTHOR ID", "LAST NAME", "FIRST NAME", PUBLISHER, COUNT(*) as "TITLE COUNT" FROM tab1 GROUP BY "AUTHOR ID", PUBLISHER ORDER BY "AUTHOR ID" DESC, PUBLISHER DESC
-- Sum of TITLE COUNT is 25, which is the same as the number of records in titleauthor:
SELECT * FROM titleauthor


-- Challenge 3
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", sum(s.qty) AS TOTAL /* t.title AS TITLE, p.pub_name AS PUBLISHER */
FROM authors AS au
JOIN titleauthor as ta ON au.au_id = ta.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS p ON p.pub_id = t.pub_id
JOIN sales AS s ON s.title_id = t.title_id
GROUP BY "AUTHOR ID" ORDER BY "TOTAL" DESC LIMIT 3


-- Challenge 4
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME",
SUM(
  CASE 
    WHEN s.qty IS NULL THEN 0
    ELSE s.qty
  END
) AS TOTAL
FROM authors AS au
LEFT JOIN titleauthor as ta ON au.au_id = ta.au_id
LEFT JOIN titles AS t ON t.title_id = ta.title_id
LEFT JOIN publishers AS p ON p.pub_id = t.pub_id
LEFT JOIN sales AS s ON s.title_id = t.title_id

GROUP BY "AUTHOR ID" ORDER BY "TOTAL" DESC

