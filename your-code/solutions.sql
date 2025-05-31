-- Challenge 1: Write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers.
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
	
-- Challenge 2: how many titles each author has published at each publisher
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title) AS "TITLE COUNT"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY a.au_id DESC;

-- Challenge 3: Who are the top 3 authors who have sold the highest number of titles?
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;

-- Challenge 4: Modify solution in Challenge 3 so that the output will display all 23 authors instead of the top 3
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC;