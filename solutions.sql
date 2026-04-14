-- Query 1 (List each author with their published titles and publishers)
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER" FROM authors a JOIN titleauthor ta ON a.au_id = ta.au_id JOIN titles t ON ta.title_id = t.title_id JOIN publishers p ON t.pub_id = p.pub_id;

-- Query 2 (Count how many titles each author published at each publisher)
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", COUNT(t.title_id) AS "TITLE COUNT" FROM authors a JOIN titleauthor ta ON a.au_id = ta.au_id JOIN titles t ON ta.title_id = t.title_id JOIN publishers p ON t.pub_id = p.pub_id GROUP BY a.au_id, p.pub_name;

-- Query 3 (Top 3 authors with highest total titles sold)
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL" FROM authors a JOIN titleauthor ta ON a.au_id = ta.au_id JOIN titles t ON ta.title_id = t.title_id JOIN sales s ON t.title_id = s.title_id GROUP BY a.au_id ORDER BY TOTAL DESC LIMIT 3;

-- Query 4 (All authors ranked by total titles sold including those with zero sales)
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(SUM(s.qty),0) AS "TOTAL" FROM authors a LEFT JOIN titleauthor ta ON a.au_id = ta.au_id LEFT JOIN titles t ON ta.title_id = t.title_id LEFT JOIN sales s ON t.title_id = s.title_id GROUP BY a.au_id ORDER BY TOTAL DESC;