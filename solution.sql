-- ============================================
-- Challenge 1 - Who Have Published What At Where?
-- Get author details, title, and publisher name
-- ============================================
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id;



-- ============================================
-- Challenge 2 - Who Have Published How Many At Where?
-- Count number of titles per author at each publisher
-- ============================================
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(*) AS "TITLE COUNT"
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY COUNT(*) DESC, a.au_lname, a.au_fname;


-- ============================================
-- Challenge 3 - Best Selling Authors
-- Top 3 authors by number of titles sold
-- ============================================
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;


-- ============================================
-- Challenge 4 - Best Selling Authors Ranking
-- All authors ranked by sales (including zero)
-- ============================================
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    IFNULL(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
