-- CHALLENGE 1: WHO HAVE PUBLISHED WHAT AT WHERE?
-- Joining Authors, Titles, and Publishers to map publication history.
SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    t.title AS "TITLE", 
    p.pub_name AS "PUBLISHER"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id;

SELECT COUNT(*) FROM titleauthor; --The total rows in the output should be the same as the total number of records in Table titleauthor.


-- Challenge 2 - Who Have Published How Many At Where?
-- Aggregating titles per author and publisher
SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    p.pub_name AS "PUBLISHER",
    COUNT(t.title) AS "TITLE COUNT"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY "TITLE COUNT" DESC, "LAST NAME" ASC;

SELECT COUNT(*) FROM titleauthor; --Check if the sum of the TITLE COUNT matches the total records in titleauthor which is 25.


-- Challenge 3 - Best Selling Authors
-- Ranked by total units sold (ytd_sales)
SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    SUM(t.ytd_sales) AS "TOTAL"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;


-- CHALLENGE 4: BEST SELLING AUTHORS RANKING
-- All 23 authors ranked by total units sold

SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    IFNULL(SUM(t.ytd_sales), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC;
