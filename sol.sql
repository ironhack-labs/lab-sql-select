-- =============================================================================
-- Lab SQL Solutions
-- =============================================================================

-- Challenge 1
SELECT 
    a.au_id          AS "AUTHOR ID",
    a.au_lname       AS "LAST NAME",
    a.au_fname       AS "FIRST NAME",
    t.title          AS "TITLE",
    p.pub_name       AS "PUBLISHER"
FROM authors a
INNER JOIN titleauthor ta  ON a.au_id     = ta.au_id
INNER JOIN titles t        ON ta.title_id = t.title_id
INNER JOIN publishers p    ON t.pub_id    = p.pub_id
ORDER BY 
    a.au_lname, 
    a.au_fname, 
    t.title;

-- Challenge 2

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "NUMBER OF TITLES"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name
ORDER BY 
    a.au_lname,
    a.au_fname,
    p.pub_name;

-- Challenge 3
SELECT 
    a.au_id          AS "AUTHOR ID",
    a.au_lname       AS "LAST NAME",
    a.au_fname       AS "FIRST NAME",
    SUM(t.ytd_sales) AS "TOTAL"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t        ON ta.title_id = t.title_id
GROUP BY 
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY 
    SUM(t.ytd_sales) DESC
LIMIT 3;
-- Challenge 4
SELECT 
    a.au_id          AS "AUTHOR ID",
    a.au_lname       AS "LAST NAME",
    a.au_fname       AS "FIRST NAME",
    COALESCE(SUM(t.ytd_sales), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t        ON ta.title_id = t.title_id
GROUP BY 
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY 
    "TOTAL" DESC;